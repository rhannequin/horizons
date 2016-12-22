require 'spec_helper'
require 'fixtures/fixtures'

describe Horizons::ObjectDataPageParser do
  context '::parse' do
    Fixtures.planets.each do |body|
      context body.to_s.capitalize do
        subject { described_class.parse(Fixtures.without_layout Fixtures.send(body)) }

        it 'returns a hash' do
          expect(subject).to be_kind_of(Hash)
        end
      end
    end
  end
end
