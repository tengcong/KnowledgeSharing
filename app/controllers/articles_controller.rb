class ArticlesController < ApplicationController
  respond_to :json
  def create
    Article.collect params, current_user
  end

  def index
    @articles = Article.all
  end

  def show
    article = Article.find(params[:id])
    article.content = Article.renderer.render(article.content)
    render :json => article.to_json
  end
end
