require 'spec_helper'

describe Horizons::DataLines do
  context '#export_values' do
    let(:data_lines) do
      data_lines = described_class.new
      data_lines.lines = ['Mean radius (km)      = 3389.9(2+-4)    Density (g cm^-3)     =  3.933(5+-4)']
      data_lines.middle = 36
      data_lines
    end

    it 'returns a hash' do
      expect(data_lines.export_values).to eq({ mean_radius: 3389.9, density: 3.933 })
    end
  end

  context '#calculate_middle!' do
    let(:data_lines) do
      data_lines = described_class.new
      data_lines.middles = [10, 10, 9, 10, 10]
      data_lines
    end

    it 'set @middle to the most present value in @middles' do
      data_lines.calculate_middle!
      expect(data_lines.middle).to eq(10)
    end
  end

  context '#splitted_line' do
    let(:data_lines) do
      data_lines = described_class.new
      data_lines.middle = 9
      data_lines
    end

    let(:line) { 'www = xxx  yyy = zzz' }

    it 'returns an array of the splitted line' do
      expect(data_lines.splitted_line(line)).to match_array(['www = xxx', 'yyy = zzz'])
    end
  end
end
