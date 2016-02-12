class VideosController < ApplicationController
  before_action :logged_in_user, only: [:create, :new, :show, :index, :destroy]
  before_action :set_video, only: [:show,:create, :edit, :update, :destroy]

  def index
    @videos = Video.all
  end

  def show
    @comments = @video.comments
  end

  def new
    @video = Video.new
  end

  def edit
  end

  def create
    @video = Video.new(video_params)
    if @video.save
      redirect_to @video, notice: 'Video was successfully created.'
    else
      render 'new'
    end
  end

  def update
    if @video.update(video_params)
      redirect_to @video, notice: 'Video was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @video.destroy
    redirect_to videos_url, notice: 'Video was successfully destroyed.'
  end

  private

    def set_video
      @video = Video.find(params[:id])
    end

    def video_params
      params.require(:video).permit(:title_pt_br, :title_es, :link, :tag_ids => [])
    end
end
