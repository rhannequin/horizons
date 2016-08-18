require 'spec_helper'

describe Horizons::ObjectDataPageLine do
  context '#has_data?' do
    let(:with_data) { described_class.new 'www = xxx   yyy = zzz' }
    let(:without_data) { described_class.new '***' }

    it 'true if when data' do
      expect(with_data.has_data?).to be_truthy
    end

    it 'false if when no data' do
      expect(without_data.has_data?).to be_falsey
    end
  end
end
