class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    @article = Article.new   # ← フォーム用
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
      redirect_to articles_path, notice: "記事を作成しました"
    else
      @articles = Article.all
      render :index
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article, notice: "記事を更新しました"
    else
      render :edit
    end
  end

  def destroy
    p "888"
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path, notice: "記事を削除しました"

  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end

