module Horizons
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
