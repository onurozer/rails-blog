class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  private

  # See https://guides.rubyonrails.org/getting_started.html#using-strong-parameters
  # for more info on the rationale for cleaning parameters before submitting to models
  def article_params
    params.require(:article).permit(:title, :body)
  end
end
