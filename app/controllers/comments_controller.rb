class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)
    if @comment.save
      redirect_to @article, notice: "コメントを投稿しました。"
    else
      redirect_to @article, alert: "コメントを入力してください。"
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to @article, notice: "コメントを削除しました。"
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end


end
