class EventsController < ApplicationController
  def index
    @events = Event.all.order(date: :asc)
    
    @props = {
      events: @events,
      user: current_user,
      component: {
        name: 'eventList'
      }
    }
  end
end
