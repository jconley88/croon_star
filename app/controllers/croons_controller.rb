class CroonsController < ApplicationController
  def index
    @songs = Song.all
    page = params[:page] || 1
    @croons = Croon.where(:recording_filename.exists => true).order_by(:time_stamps.desc).paginate(:page => page, :per_page => 15)
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
