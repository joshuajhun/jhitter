class TimelineController < ApplicationController
  def index
    @tweets = TwitterTimeline.all(current_user)
  end

  def show
    @tweet = TwitterTimeline.find(params[:id], current_user)
  end

  def new
  end

  def create
    @tweet = TwitterTimeline.create(params[:status])
    redirect_to root_path
  end
end
