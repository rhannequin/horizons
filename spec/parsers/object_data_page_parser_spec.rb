require 'spec_helper'
require 'fixtures/fixtures'

describe Horizons::ObjectDataPageParser do
  context '::parse' do
    context 'Mars' do
      subject { described_class.parse Fixtures.mars }

      it 'returns a hash' do
        expect(subject).to be_kind_of(Hash)
      end
    end

    context 'Jupiter' do
      subject { described_class.parse Fixtures.jupiter }

      it 'returns a hash' do
        expect(subject).to be_kind_of(Hash)
      end
    end
  end
end
