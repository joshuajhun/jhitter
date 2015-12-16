class TimelineController < ApplicationController
  def index
    @tweets = TwitterTimeline.all
  end

  def show
    @tweet = TwitterTimeline.find(params[:id])
  end

  def new
  end

  def create
    @tweet = TwitterTimeline.create(params[:status])
    redirect_to root_path
  end
end
