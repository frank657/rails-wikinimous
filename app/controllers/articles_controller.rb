class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :user_params, only: [:update]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(user_params)
    @article.save
    redirect_to article_path(@article)
  end

  def edit
  end

  def update
    @article.update(user_params)
    @article.save
    redirect_to @article
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def user_params
    params.require(:article).permit(:title, :content)
  end
end
