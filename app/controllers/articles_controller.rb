class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    @article = Article.new   # ← フォーム用
    @q = params[:q].to_s.strip
      if @q.present?
        like = "%#{ActiveRecord::Base.sanitize_sql_like(@q)}%"
        @articles = Article
                      .where("title LIKE :q OR body LIKE :q", q: like)
                      .order(created_at: :desc)
      else
        @articles = Article.order(created_at: :desc)
      end
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
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path, notice: "記事を削除しました"
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end





end

