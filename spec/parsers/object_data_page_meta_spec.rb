require 'spec_helper'
require 'fixtures/fixtures'

describe Horizons::ObjectDataPageMeta do
  context '#export' do
    [
      { name: :mercury, revised_on: Date.new(2013, 7, 31), id: 199 },
      { name: :venus, revised_on: Date.new(2013, 7, 31), id: 299 },
      { name: :earth, revised_on: Date.new(2013, 7, 31), id: 399 },
      { name: :mars, revised_on: Date.new(2012, 9, 28), id: 499 },
      { name: :jupiter, revised_on: Date.new(2016, 9, 13), id: 599 },
      { name: :saturn, revised_on: Date.new(2016, 6, 17), id: 699 },
      { name: :uranus, revised_on: Date.new(2016, 6, 17), id: 799 },
      { name: :neptune, revised_on: Date.new(2013, 12, 12), id: 899 }
    ].each do |body|
      context body[:name].to_s.capitalize do
        subject { described_class.new(Fixtures.without_layout Fixtures.send(body[:name])).export }

        it 'returns a hash' do
          expect(subject).to be_kind_of(Hash)
        end

        it 'has correct information' do
          expect(subject).to eq({
            revised_on: body[:revised_on],
            name: body[:name].to_s.capitalize,
            id: body[:id]
          })
        end
      end
    end
  end
end
