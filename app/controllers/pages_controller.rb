class PagesController < ApplicationController
  
  
  def home
    @places = Place.all
    @stories = Story.all
  
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @story }
    end
  end

  def contact
  end

  def about
  end

  

end
