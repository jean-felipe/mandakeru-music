module Api::V1
  class EventsController < ActionController::API
    before_action :load_filters, only: [:index]

    def create
      render json: creator.process
    end

    def index
      if @filter.present?
        @events = Event.joins(:genres).where('genres.id = ?', @filter)
      else
        @events = Event.all
      end

      render json: @events

    end

    private

    def creator
      @creator = Events::Create.new(event_params)
    end

    def event_params
      {
        name: params.dig('event', 'name'),
        date: "#{params.dig('event', 'date')} #{params.dig('event', 'time')}",
        private: false,
        event_type: params.dig('event', 'eventType'),
        lineup: params.dig('event', 'lineup'),
        artists: params.dig('event', 'artists').as_json,
        genres: params.dig('event', 'genres').as_json,
        address: params.dig('event', 'address').as_json
      }
    end

    def load_filters
      @filter = params.dig('filter', 'genre')
    end
  end
end
