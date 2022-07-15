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
    @article = Article.new(title: "...", body: "...")

    if @article.save
      redirect_to @article
    else
      # ok: rails-no-render-after-save
      render :new, status: :unprocessable_entity
    end
  end

  def createok
    @article = Article.new(title: "...", body: "...")
    # ok: rails-no-render-after-save
    render @article
  end

  def createbad
    @article = Article.new(title: "...", body: "...")
    @article.save
    # ruleid: rails-no-render-after-save
    render @article
  end

  # this is nonsense but it "looks" like a bad ActiveRecord pattern
  def doSomethingElse
    foo = Type.new()
    foo.bar
    # ok: rails-no-render-after-save
    render foo
  end
end