class EventsController < ApplicationController
  def index
    @events = reader.process

    @props = {
      events: @events,
      user: current_user,
      component: {
        name: 'eventList'
      }
    }
  end

  private

  def reader
    @reader = Events::Read.new
  end
end
