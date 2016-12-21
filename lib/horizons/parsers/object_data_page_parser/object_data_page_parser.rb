require 'horizons/parsers/object_data_page_parser/data_lines'
require 'horizons/parsers/object_data_page_parser/object_data_page_line'
require 'horizons/parsers/object_data_page_parser/object_data_page_meta'

module Horizons
  module ObjectDataPageParser
    module_function

    def parse(object_data_page)
      meta = ObjectDataPageMeta.new(object_data_page).export
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
      meta.merge({ data: data_lines.export_values })
    end
  end
end
