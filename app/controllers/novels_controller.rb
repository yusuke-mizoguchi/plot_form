class NovelsController < ApplicationController
  before_action :set_novel, only: [:edit, :update, :destroy]
  skip_before_action :require_login, only: [:index, :show]

  def index
    #@q = Novel.ransack(params[:q])
    #@novels = @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page])
  end

  def new
    @novel = Novel.new
  end

  def create
    @novel = current_user.novels.build(novel_params)
    if @novel.save
      redirect_to novels_path
    else
      render :new
    end
  end

  def show
    @novel = novel.find(params[:id])
    @review = Comment.new
    @reviews = @novel.reviews.includes(:user).order(created_at: :desc)
  end

  def edit; end

  def update
    if @novel.update(novel_params)
      redirect_to @novel
    else
      render :new
    end
  end

  def destroy
    @novel.destroy!
    redirect_to novels_path
  end

  private

  def set_novel
    @novel = current_user.novels.find(params[:id])
  end

  def novel_params
    params.require(:novel).permit(:title, :genre, :story_length, :plot, :image)
  end
end
