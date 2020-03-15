require 'rails_helper'

RSpec.describe Events::Read do
  let(:subject) { described_class.new(nil) }

  describe '#process' do
    before do
      create_list(:event, 10)
      @response = subject.process
    end

    context 'call process to read events' do
      it "list the events" do
        expect(@response.count).to eq(30)
      end

      it "group the events by day, starting today" do
        expect(@response.first.dig(:date)).to eq(Date.today.strftime("%d/%m/%Y"))
      end

      it "list all events from today" do
        expect(@response.first.dig(:events).count).to eq(10)
      end
    end
  end
end
