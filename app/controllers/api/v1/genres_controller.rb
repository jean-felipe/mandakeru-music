module Api::V1
  class GenresController < ActionController::API
    def index
      render json: Genre.all.map { |a| { value: a.id, label: a.name }}
    end
  end
end
