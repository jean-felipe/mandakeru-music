require 'rails_helper'

RSpec.describe Api::V1::ArtistsController do
  login_user
  describe '#index' do
    before do
      @artists = create_list(:artist, 3)
    end

    it 'returns all artists created' do
      get :index
      expect(json.count).to eq(3)
    end
  end
end
