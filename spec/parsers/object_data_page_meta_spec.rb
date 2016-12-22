require 'spec_helper'
require 'fixtures/fixtures'

describe Horizons::ObjectDataPageMeta do
  context '#export' do
    context 'Mars' do
      subject { described_class.new(Fixtures.without_layout Fixtures.mars).export }

      it 'returns a hash' do
        expect(subject).to be_kind_of(Hash)
      end

      it 'has correct information' do
        expect(subject).to eq({
          revised_on: Date.new(2012, 9, 28),
          name: 'Mars',
          id: 499
        })
      end
    end

    context 'Jupiter' do
      subject { described_class.new(Fixtures.without_layout Fixtures.jupiter).export }

      it 'returns a hash' do
        expect(subject).to be_kind_of(Hash)
      end

      it 'has correct information' do
        expect(subject).to eq({
          revised_on: Date.new(2016, 9, 13),
          name: 'Jupiter',
          id: 599
        })
      end
    end
  end
end
