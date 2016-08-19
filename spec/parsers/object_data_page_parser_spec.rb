require 'spec_helper'
require 'fixtures/fixtures'

describe Horizons::ObjectDataPageParser do
  context '::parse' do
    subject { described_class.parse Fixtures.mars }

    it 'returns a hash' do
      expect(subject).to be_kind_of(Hash)
    end
  end
end
