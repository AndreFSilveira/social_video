class StaticPagesController < ApplicationController
  def home
    @news = News.last(3)
    @videos = Video.last(5)
  end
end
