class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :edit, :update, :destroy]

  def index
    @stories = Story.all.order(created_at: :desc)
  end

  def new
    @story = Story.new
  end
  
  def show; end

  def create
    @story = Story.new(story_params)
    if @story.save
      redirect_to stories_path
    else
      # redirect_to new_story_path
      render :new
    end
  end

  def edit; end

  def update
    if @story.update(story_params)
      redirect_to stories_path
    else
      redirect_to edit_story_path
    end
  end

  def destroy
    if @story.destroy
      redirect_to stories_path
    else
      redirect_to stories_path
    end
  end

  private
  def story_params
    params.require(:story).permit(:title, :description)
  end

  def set_story
    @story = Story.find(params[:id])
  end
end
