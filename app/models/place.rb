class Place < ActiveRecord::Base

  acts_as_mappable :auto_geocode => true
  has_many :stories

  def geocoded?
    self.lat.present? && self.lng.present?
  end
  

end
