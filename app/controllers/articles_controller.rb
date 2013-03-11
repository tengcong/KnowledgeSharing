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
    article.content = Article.renderer.render 'This is *bongos*, indeed.'
    # article.tags = article.tags
    render :json => article.to_json
  end
end
