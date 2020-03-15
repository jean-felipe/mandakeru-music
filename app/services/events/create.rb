module Events
  class Create
    def initialize(params)
      @params = params
      @artists = []
      @genres = []
      @errors = []
    end

    def process
      load_artists
      load_genres
      @new_event = Event.new(@params.except(:artists, :lineup, :genres, :address))

      if @new_event.save
        @new_event.genres = @genres

        address = Address.new(@params[:address].merge(event: @new_event))
        address.save

        lineup = LineUp.new(name: @params[:lineup], event: @new_event)
        if lineup.save
          lineup.artists = @artists
        else
          @errors.push(lineup.errors.messages)
        end
        @new_event
      else
        @errors.push(@new_event.errors.messages)
      end
    end

    private

    def load_artists
      @params[:artists].each do |hash|
        @artists.push(Artist.find(hash["value"]))
      end
    end

    def load_genres
      @params[:genres].each do |hash|
        @genres.push(Genre.find(hash["value"]))
      end
    end
  end
end
