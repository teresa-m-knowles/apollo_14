class AstronautsController < ApplicationController
  def index
    @astronauts = Astronaut.all
    @missions = Mission.order(:title).all
  end
end
