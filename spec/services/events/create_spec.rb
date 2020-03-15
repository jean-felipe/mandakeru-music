require 'rails_helper'

RSpec.describe Events::Create do
  let(:subject) { described_class.new(params) }
  let(:params) do
    {
      name: name,
      date: date,
      private: false,
      event_type: event_type,
      lineup: lineup,
      artists: artists,
      genres: genres,
      address: address
    }
  end

  describe '#process' do
    let(:date) { '02/06/2020 19:00' }
    let(:private) { false }
    let(:lineup) { 'Sertão Agreste' }
    let(:address) { attributes_for(:address) }
    let(:artists) { create_list(:artist, 3).map { |a| { value: a.id, label: a.name }}.as_json }
    let(:genres) { create_list(:genre, 3).map { |a| { value: a.id, label: a.name }}.as_json }

    context 'sucess' do
      let(:name) { 'Festival Junino' }
      let(:event_type) { 'festival' }

      it "creates a new Event, LineUp and Address" do
        expect { subject.process }.to change{ [Event.count, LineUp.count, Address.count ]}.by([1, 1, 1])
      end

      it 'creates the Event' do
        event = subject.process
        expect(event.name).to eq(name)
        expect(event.date.strftime("%d/%m/%Y %H:%M")).to eq(date)
        expect(event.line_up.name).to eq(lineup)
      end
    end

    context 'fail' do
      let(:name) { nil }
      let(:event_type) { 'festival' }

      it 'failed to create' do
        expect { subject.process }.to change{ Event.count }.by(0)
      end

      it "returns the errors" do
        event = subject.process
        expect(event.first.dig(:name)).to eq(["can't be blank"])
      end
    end
  end
end
