require 'horizons/parsers/object_data_page_parser/object_data_page_parser'

module Horizons
  class Body
    attr_accessor :revised_on, :name, :id, :data

    def initialize(attributes)
      self.revised_on = attributes.fetch(:revised_on)
      self.name = attributes.fetch(:name)
      self.id = attributes.fetch(:id)
      self.data = attributes.fetch(:data)
    end

    def revised_on=(date)
      date = Date.parse(date) if date.respond_to?(:to_str)
      @revised_on = date
    end

    def id=(id)
      @id = Integer(id)
    end

    def self.find(client, body, parser=ObjectDataPageParser)
      page = client.cmd('String' => body.to_s, 'Match' => /<cr>:\s*$/)
      page = remove_layout(page)
      page = parser.parse(page)
      self.new(page)
    end

    def self.remove_layout(page)
      lines = page.split("\n")
      lines.pop(2)
      lines.shift(2)
      lines.join("\n")
    end
  end
end
