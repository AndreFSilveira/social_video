class VideosController < ApplicationController
  before_action :logged_in_user, only: [:create, :new, :edit, :update, :destroy]
  before_action :set_video, only: [:show, :edit, :update, :destroy]

  def index
    @videos = Video.paginate(page: params[:page], per_page: 12)
  end

  def show
    @comments = @video.comments
    prepare_tags
  end

  def new
    @video = Video.new
  end

  def edit
  end

  def create
    @video = Video.new(video_params)
    if @video.save
      redirect_to @video, notice: t("message.video.create")
    else
      render 'new'
    end
  end

  def update
    if @video.update(video_params)
      redirect_to @video, notice: t("message.video.update")
    else
      render :edit
    end
  end

  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to videos_url, notice: t("message.video.destroy") }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  private

    def set_video
      @video = Video.find(params[:id])
    end

    def video_params
      params.require(:video).permit(:title_pt_br, :title_es, :link, :tag_ids => [])
    end

    def prepare_tags
      @tags = Array.new
      @video.tag_ids.each do |tag|
        @tags << Tag.find(tag)
      end
    end
end
