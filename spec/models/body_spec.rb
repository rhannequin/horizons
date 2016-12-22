require 'spec_helper'
require 'fixtures/fixtures'

describe Horizons::Body do
  let(:parsed_data) { {
    revised_on: Date.today,
    name: 'Mars',
    id: 499,
    data: {}
  } }

  context '::new' do
    subject { described_class.new(parsed_data) }

    it 'responds to #revised_on' do
      expect(subject.revised_on).to eq(Date.today)
    end

    it 'responds to #name' do
      expect(subject.name).to eq('Mars')
    end

    it 'responds to #id' do
      expect(subject.id).to eq(499)
    end

    it 'responds to #data' do
      expect(subject.data).to eq({})
    end
  end

  context '::find' do
    let(:client) { double('Client', cmd: Fixtures.mars) }
    let(:body) { 499 }
    let(:parser) { double('Parser', parse: parsed_data) }

    subject { described_class.find(client, body, parser) }

    it 'returns correct body id' do
      expect(subject.id).to eq(499)
    end
  end

  context '::remove_layout' do
    let(:page) { Fixtures.mars }

    subject { described_class.remove_layout(page) }

    it 'removes layout lines' do
      expect(subject).not_to include('***')
    end
  end
end
