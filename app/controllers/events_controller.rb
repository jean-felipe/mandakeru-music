class EventsController < ApplicationController
  def index
    @events = Event.all.order(date: :asc).map do |event|
      {
        id: event.id,
        name: event.name,
        event_date: event.date&.strftime("%d/%m/%Y %H:%M"),
        event_private: event.private,
        event_type: event.event_type,
      }
    end
    
    @props = {
      events: @events,
      user: current_user,
      component: {
        name: 'eventList'
      }
    }
  end
end
