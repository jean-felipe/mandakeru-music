class HomeController < ApplicationController
  def index
    @props = {
      user: current_user
    }
  end
end
