class EventsController < ApplicationController
  def index
    @events = reader.process
    @genres = Genre.all.map { |a| { value: a.id, label: a.name }}

    @props = {
      events: @events,
      genres: @genres,
      user: current_user,
      component: {
        name: 'eventList'
      }
    }
  end

  def new
    @props = {
      user: current_user,
      component: {
        name: 'newEvent'
      }
    }
  end

  private

  def reader
    @reader = Events::Read.new
  end
end
