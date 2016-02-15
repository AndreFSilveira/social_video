class NewsController < ApplicationController
  before_action :set_news, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:create, :edit, :update, :destroy]


  def index
    @news = News.search(params[:search]).paginate(page: params[:page], per_page: 12)
  end

  def show
    @comments = @news.comments
    prepare_tags
  end

  def new
    @news = News.new
  end

  def edit
  end

  def create
    @news = News.new(news_params)
    if @news.save
      redirect_to @news, notice: 'News was successfully created.'
    else
      render :new
    end

  end

  def update
    if @news.update(news_params)
      redirect_to @news, notice: 'News was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @news.destroy
    redirect_to news_index_url, notice: 'News was successfully destroyed.'
  end

  private
    def set_news
      @news = News.find(params[:id])
    end

    def news_params
      params.require(:news).permit(:title_pt_br, :title_es, :content_pt_br, :content_es, :tag_ids => [])
    end

    def prepare_tags
      @tags = Array.new
      @news.tag_ids.each do |tag|
        @tags << Tag.find(tag)
      end
    end
end
