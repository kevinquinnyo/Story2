class Rating < ActiveRecord::Base

  belongs_to :story
  belongs_to :user

  def already_awesomed?
    @rating.each do |rating|
      rating.user_id == @current_user.id && rating.story_id == @story.find(params[:id])
    end
  end 


end
