class StoriesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:make_as_read, :make_as_unread]
  before_action :set_story, only: [:show, :edit, :update, :destroy, :make_as_read, :make_as_unread]

  def index
    @stories = Story.all.order(created_at: :desc)
  end

  def new
    @story = Story.new
  end
  
  def show; end

  def create
    @story = Story.new(story_params)
    respond_to do |format|
      if @story.save
        format.html { redirect_to stories_path, notice: "Story was successfully destroyed." }
      else
        format.html { render :new }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @story.update(story_params)
        format.html { redirect_to stories_path }
        format.turbo_stream { render turbo_stream: turbo_stream.replace("story_#{@story.id}", partial: 'story', locals: { story: @story }) }
      else
        format.html { redirect_to edit_story_path }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @story.destroy
        format.html { redirect_to stories_path }
        format.turbo_stream
      else
        format.html { redirect_to stories_path, notice: @story.errors.full_message }
      end
    end
  end

  # GET /search?search='abc'
  def search
    @stories = Story.where("title LIKE ?", "%#{params[:search]}%").order(created_at: :desc)
    respond_to do |format|
      format.json { render json: render_to_string(partial: 'stories/story', collection: @stories, formats: [:html])}
    end
  end

  # PATCH stories/:story_id/make_as_read
  def make_as_read
    @story.update(mark_as_read: true)
    respond_to do |format|
      format.json { render json: render_to_string(partial: 'stories/story', locals: {story: @story}, formats: [:html])}
    end
  end
  
  # PATCH stories/:story_id/make_as_unread
  def make_as_unread
    @story.update(mark_as_read: false)
    respond_to do |format|
      format.json { render json: render_to_string(partial: 'stories/story', locals: {story: @story}, formats: [:html])}
    end
  end

  private
  def story_params
    params.require(:story).permit(:title, :description)
  end

  def set_story
    @story = if params[:id].present?
              Story.find(params[:id])
             elsif params[:story_id].present?
              Story.find(params[:story_id])
             end
  end
end
