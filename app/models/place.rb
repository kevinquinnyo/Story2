class Place < ActiveRecord::Base

  acts_as_mappable :auto_geocode => true

  def geocoded?
    self.lat.present? && self.lng.present?
  end
  

end
