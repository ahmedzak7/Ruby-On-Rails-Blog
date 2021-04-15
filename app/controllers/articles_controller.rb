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

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.users_id == current_user.id

      if @article.update(article_params)
      redirect_to @article
      else
      render :edit
      end
    else
      redirect_to root_path, notice: "You are not the owner of this article"
    end

  end

  def destroy
    @article = Article.find(params[:id])

    # Check if article is owned by user
    if @article.users_id == current_user.id
        @article.destroy
        redirect_to root_path
    else
        redirect_to root_path, notice: "You are not the owner of this article"
    end
  end
  
  
  

  private
    def article_params
      params.require(:article).permit(:title, :body, :status)
    end

end
