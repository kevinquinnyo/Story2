class ApplicationController < ActionController::Base
  
  before_filter :geokit

  geocode_ip_address

  def geokit 
    store_ip_location
    @current_location = session[:geo_location]  # @current_location is a GeoLoc instance. 
    
  end
  def store_location
    session[:return_to] = request.request_uri
  end

  protect_from_forgery
end
