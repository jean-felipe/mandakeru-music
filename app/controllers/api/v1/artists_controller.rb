module Api::V1
  class ArtistsController < ApplicationController
    def index
      render json: Artist.all.map { |a| { value: a.id, label: a.name }}
    end
  end
end
