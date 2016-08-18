require 'spec_helper'

describe Horizons::DataLines do
  context '#export_values' do
    let(:data_lines) do 
      data_lines = described_class.new
      data_lines.lines = ['www = xxx   yyy = zzz']
      data_lines.middle = 12
      data_lines
    end

    it 'returns an array of arrays [key, value]' do
      expect(data_lines.export_values).to eq([['www', 'xxx'], ['yyy', 'zzz']])
    end
  end
end
