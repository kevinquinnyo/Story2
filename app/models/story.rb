class Story < ActiveRecord::Base

  belongs_to :user
  has_many :ratings

  # Geokit
  acts_as_mappable :auto_geocode => true
  
  def geocoded?
    self.lat.present? && self.lng.present?
  end
  
  def rate_for_user(direction, rating_user)
    # if this user already has a rating, don't let them rate.
    unless self.ratings.find_by_user_id(rating_user.id)
      # create a new rating for this user to keep track of it
      self.ratings.create(:user_id => rating_user.id)
      # increment or decrement the rating value
      if direction == "up"
        increment!(:value)
      else # direction == "down"
        decrement!(:value)
      end
    end
  end

end
