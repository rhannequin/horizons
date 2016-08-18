require 'spec_helper'
require 'fixtures/fixtures'

describe Horizons::ObjectDataPageParser do
  context '::parse' do
    subject { described_class.parse Fixtures.mars }

    it 'returns an array' do
      expect(subject).to be_kind_of(Array)
    end

    it 'first element is an array' do
      expect(subject.first).to be_kind_of(Array)
    end

    it 'first element has two string values' do
      el = subject.first
      expect(el.count).to eq(2)
      expect(el.first).to be_kind_of(String)
      expect(el.last).to be_kind_of(String)
    end
  end
end
