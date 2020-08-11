class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(strong_params)
    @article.save
    redirect_to articles_path(@article)
  end

  def edit
  end

  def update
    @article.update(strong_params)
    redirect_to articles_path(@article)
  end

  def destroy
    @article.destroy
    redirect_to articles_path(@article)
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def strong_params
    params.require(:article).permit(:title, :content)
  end
end
