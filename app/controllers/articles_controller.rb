class ArticlesController < ApplicationController
  http_basic_authenticate_with name: 'admin', password: 'admin', except: %i[index show]
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

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to root_path
  end

  private

  # See https://guides.rubyonrails.org/getting_started.html#using-strong-parameters
  # for more info on the rationale for cleaning parameters before submitting to models
  def article_params
    params.require(:article).permit(:title, :body, :status)
  end
end
