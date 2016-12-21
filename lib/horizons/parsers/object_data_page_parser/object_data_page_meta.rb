module Horizons
  class ObjectDataPageMeta
    attr_accessor :data

    def initialize(object_data_page)
      @data = object_data_page
    end

    def export
      line = data.split("\n").first
      els = line.split('   ').reject { |c| c.empty? }.map(&:strip)
      {
        revised_on: Date.parse(els.first.split(':').last),
        name: els[1],
        id: els.last.split('/').first.to_i
      }
    end
  end
end
