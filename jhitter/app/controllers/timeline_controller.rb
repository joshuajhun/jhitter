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
    @tweet = TwitterTimeline.create(params[:message][:tweet], current_user)
    redirect_to timeline_index_path
  end
end
