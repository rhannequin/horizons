require 'spec_helper'

describe Horizons::ObjectDataPageLine do
  let(:with_data) { described_class.new 'Www = xxx   Yyy = zzz' }
  let(:without_data) { described_class.new '***' }

  context '#has_data?' do
    it 'true if when data' do
      expect(with_data.has_data?).to be_truthy
    end

    it 'false if when no data' do
      expect(without_data.has_data?).to be_falsey
    end
  end

  context '#matched' do
    context 'with data' do
      it 'returns a MatchData object' do
        expect(with_data.matched).to be_kind_of(MatchData)
      end

      it 'to string returns the middle spaces and the first letter of the second value' do
        expect(with_data.matched.to_s).to eq('   Y')
      end
    end

    context 'without data' do
      it 'returns nil' do
        expect(without_data.matched).to be_nil
      end
    end
  end

  context '#middle_position' do
    it 'returns the position in line where the first value ends' do
      expect(with_data.middle_position).to eq(9)
    end
  end
end
