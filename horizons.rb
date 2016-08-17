module Horizon
  class ObjectDataPageParser
    def self.parse(object_data_page)
      data_lines = DataLines.new

      object_data_page.each_line do |line|
        object_data_page_line = ObjectDataPageLine.new(line)

        if object_data_page_line.has_data?
          data_lines.lines << object_data_page_line.line
          reg = object_data_page_line.matched
          if reg
            data_lines.middles << object_data_page_line.middle_position + reg.to_s.size - 1
          end
        end
      end

      data_lines.calculate_middle!
      data_lines.export_values
    end
  end

  class DataLines
    attr_accessor :lines, :middles, :middle

    SEPARATOR = '='

    def initialize
      @lines = []
      @middles = []
    end

    def calculate_middle!
      freq = middles.inject(Hash.new(0)) { |h, v| h[v] += 1; h }
      @middle = middles.max_by { |v| freq[v] }
    end

    def export_values
      values = []
      lines.each do |line|
        v1 = line.slice(0..middle - 1).strip
        v2 = line.slice(middle..-1).strip
        values.concat [v1, v2].map { |v| v.split(SEPARATOR).map(&:strip) }
      end
      values
    end
  end

  class ObjectDataPageLine
    attr_accessor :line

    SEPARATOR = '='
    REG = /\s{3,}[A-Z]/

    def initialize(line)
      @line = line
    end

    def has_data?
      line.count(SEPARATOR) > 0
    end

    def matched
      REG.match line
    end

    def middle_position
      line.to_enum(:scan, REG).map { |m,| $`.size }.first
    end
  end
end


File.open('mars.txt', 'r') do |f|
  Horizon::ObjectDataPageParser.parse(f)
end
