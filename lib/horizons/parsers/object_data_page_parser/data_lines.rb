module Horizons
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
end
