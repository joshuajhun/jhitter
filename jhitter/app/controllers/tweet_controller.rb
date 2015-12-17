class TweetController < ApplicationController
  def update
    TwitterTimeline.favor(params[:format].to_i, current_user)
    redirect_to timeline_index_path
  end
end
