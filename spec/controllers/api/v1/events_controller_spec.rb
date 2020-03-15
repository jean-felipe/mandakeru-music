require 'rails_helper'

RSpec.describe Api::V1::EventsController do
  login_user

  describe '#create' do
    context 'when success create a event' do
      let(:artists) { create_list(:artist, 3) }
      let(:genres) { create_list(:genre, 3) }
      let(:address) { create(:address) }
      let(:params) do
        {
          name: 'Festival de Reggar',
          date: '02/03/2020 15:00',
          private: false,
          eventType: 'festival',
          lineup: 'Cantores Classicos',
          artists: artists.map { |a| { value: a.id, label: a.name }},
          genres: genres.map { |a| { value: a.id, label: a.name }},
        }
      end

      it 'creates the event' do
        post :create, params: { event: params }
        expect(response.status).to eq(200)
        expect_json(name: 'Festival de Reggar', date: '2020-03-02T15:00:00.000Z', event_type: 'festival')
      end
    end

    context 'when failed to create event' do
      let(:artists) { create_list(:artist, 3) }
      let(:genres) { create_list(:genre, 3) }
      let(:address) { create(:address) }
      let(:params) do
        {
          name: 'Festival de Reggar',
          date: '02/03/2020 15:00',
          private: false,
          lineup: 'Cantores Classicos',
          artists: artists.map { |a| { value: a.id, label: a.name }},
          genres: genres.map { |a| { value: a.id, label: a.name }},
        }
      end

      it 'returns an error for creation' do
        post :create, params: { event: params }
        expect(json.first.dig('event_type', 0)).to eq("can't be blank")
      end
    end
  end

  describe '#index' do
    let(:genres) { create_list(:genre, 3)}
    let(:other_genres) { create_list(:genre, 3)}

    before do
      create(:event, genres: genres)
      create(:event, genres: genres)
      create(:event, genres: genres)
      create(:event, genres: other_genres)
    end

    context 'when filtering events by genre' do
      context 'filtering by genre name' do
        it "returns all events related with the genre" do
          get :index, params: { filter: { genre: genres.first.id } }
          expect(json.count).to eq(3)
        end

        it "returns all events related with the genre" do
          get :index, params: { filter: { genre: genres.second.id } }
          expect(json.count).to eq(3)
        end
      end

      context 'when filtering by other_genres ids' do
        it "returns all events related with the genre" do
          get :index, params: { filter: { genre: other_genres.first.id } }
          expect(json.count).to eq(1)
        end
      end

      context 'when filtering by a unknow id'  do
        it "returns a void array" do
          get :index, params: { filter: { genre: 9999 } }
          expect(json.count).to eq(0)
        end
      end

    end
  end
end
