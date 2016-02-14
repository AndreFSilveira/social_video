class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:create, :edit, :update, :destroy]

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def edit
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to new_tag_path, notice: t("message.tag.create")
    else
      render :new
    end
  end

  def update
    if @tag.update(tag_params)
      redirect_to @tag, notice: t("message.tag.update")
    else
      render :edit
    end
  end

  def destroy
    @tag.destroy
    redirect_to tags_url, notice: t("message.tag.destroy")
  end

  private

    def set_tag
      @tag = Tag.find(params[:id])
    end

    def tag_params
      params.require(:tag).permit(:name_pt_br, :name_es)
    end
end
