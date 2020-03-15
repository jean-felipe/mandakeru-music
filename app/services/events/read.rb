module Events
  class Read
    def initialize(params=nil) 
      @params = params
    end

    def process
      events = []

      initial_date = DateTime.now

      30.times do |i|
        events << {
          date: (initial_date + i.days).strftime("%d/%m/%Y"),
          events: Event.where("DATE(date) = ? ", initial_date + i.days).map do |event|
            {
              id: event.id,
              name: event.name,
              event_date: event.date&.strftime("%d/%m/%Y %H:%M"),
              event_private: event.private,
              event_type: event.event_type,
              genres: event.genres.as_json,
              artists: event.artists.as_json,
              address: event.address&.full_address
            }
          end
        }
      end
     
      events
    end
  end
end
