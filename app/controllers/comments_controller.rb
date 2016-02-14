class CommentsController < ApplicationController
  before_action :set_comment, only: [ :aprove, :destroy]
  before_action :logged_in_user, only: [:create, :destroy, :aprove]

  def create
    if params[:video_id].present?
      @video = Video.find(params[:video_id])
      @comment = @video.comments.create(comment_params)
      redirect_to video_path(@video)
    else
      @news = News.find(params[:news_id])
      @comment = @news.comments.create(comment_params)
      redirect_to news_path(@news)
    end
  end

  def aprove
    if current_user?(@comment.user)
      redirect_to :back, :flash => { :danger => t("message.news.comments.aprove_your") }
    else
      @comment.aprove = true;
      @comment.save
      redirect_to :back, notice: t("message.news.comments.aproved")
    end
  end

  def destroy
    @comment.destroy
    redirect_to :back, notice: t("message.news.comments.destroy")
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:content, :user_id)
    end

end
