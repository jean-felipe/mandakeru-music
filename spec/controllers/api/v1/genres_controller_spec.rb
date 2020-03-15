require 'rails_helper'

RSpec.describe Api::V1::GenresController do
  login_user
  describe '#index' do
    before do
      @genres = create_list(:genre, 3)
    end

    it 'returns all genres created' do
      get :index
      expect(json.count).to eq(3)
    end
  end
end
