class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def edit
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
  end

  def update
    @article = Article.find(params[:article_id])
    @thiscomment = @article.comments.find(params[:id])
    if @comment = @thiscomment.update(comment_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @thiscomment = @article.comments.find(params[:id])
    @thiscomment.destroy

    redirect_to @article
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end

end