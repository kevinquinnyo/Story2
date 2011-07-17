class StoriesController < ApplicationController
  
  before_filter :set_place
  before_filter :set_rating
  
  # GET /places/1/stories
  # GET /places/1//stories.xml
  def index
    @stories = @place.stories.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stories }
    end
  end
  
  # GET /places/1//stories/1
  # GET /places/1//stories/1.xml
  def show
    @story = @place.stories.find(params[:id])
    @rating = @place.ratings.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @story }
    end
  end

  # GET /places/1/stories/new
  # GET /places/1/stories/new.xml
  def new
    @story = @place.stories.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @story }
    end
  end

  # GET /places/1/stories/1/edit
  def edit
    @story = @place.stories.find(params[:id])
  end

  # POST /places/1/stories
  # POST /places/1/stories.xml
  def create
    @story = @place.stories.new(params[:story])
    @story.user = current_user
    respond_to do |format|
      if @story.save
        format.html { redirect_to(place_story_url(:place_id => @place.id, :id => @story.id), :notice => 'Story was successfully created.') }
        format.xml  { render :xml => @story, :status => :created, :location => place_story_url(:place_id => @place.id, :id => @story.id) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @story.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /places/1/stories/1
  # PUT /places/1/stories/1.xml
  def update
    @story = @place.stories.find(params[:id])

    respond_to do |format|
      if @story.update_attributes(params[:story])
        format.html { redirect_to(place_story_url(:place_id => @place.id, :id => @story.id), :notice => 'Story was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @story.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1/stories/1
  # DELETE /places/1/stories/1.xml
  def destroy
    @story = @place.stories.find(params[:id])
    @story.destroy

    respond_to do |format|
      format.html { redirect_to(place_stories_url(:place_id => @place)) }
      format.xml  { head :ok }
    end
  end
  
  private #################################

  def set_place
    @place = Place.find(params[:place_id])
  end

  def set_rating
    @rating = Rating.find(params[:rating_id])
  end
  
end
