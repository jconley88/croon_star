class CroonsController < ApplicationController
  def index
    @songs = Song.all
    @croons = Croon.all.order_by(:time_stamps.desc)
    @croon = Croon.new
  end

  def create
    @croon = Croon.new(params[:croon])
    if @croon.save
      redirect_to croon_url(@croon)
    else
      @songs = Song.all
      @croons = Croon.all
      render :index
    end
  end

  def show
    @croon = Croon.criteria.id(params[:id]).first
  end
end
