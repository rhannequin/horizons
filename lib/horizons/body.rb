require 'horizons/parsers/object_data_page_parser/object_data_page_parser'

module Horizons
  class Body
    attr_accessor :revised_on, :name, :id

    def initialize(attributes)
      self.revised_on = attributes.fetch(:revised_on)
      self.name = attributes.fetch(:name)
      self.id = attributes.fetch(:id)
    end

    def revised_on=(date)
      date = Date.parse(date) if date.respond_to?(:to_str)
      @revised_on = date
    end

    def id=(id)
      @id = Integer(id)
    end

    def self.find(client, body, parser=ObjectDataPageParser)
      data = client.cmd('String' => body.to_s, 'Match' => /<cr>:\s*$/)
      data = parser.parse(data)
      self.new(data)
    end
  end
end
