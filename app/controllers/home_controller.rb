class HomeController < ApplicationController
  def index
    @props = {
      user: current_user,
      component: {
        name: 'main'
      }
    }
  end
end
