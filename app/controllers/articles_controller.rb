class ArticlesController < ApplicationController
  before_filter :find_article, :except => [:index, :create]
  respond_to :json

  def create
    Article.collect params, current_user
  end

  def index
    @articles = Article.desc
  end

  def show
    if params[:render]
      @article.content = Article.renderer.render(@article.content)
    end
    render :json => @article.to_json
  end

  def update
    @article.update_article(params[:article], params[:tags])
    render :json => @article.to_json
  end

  def destroy
    if @article.destroy_with_orphan_tags
      render :json => {success: true}
    end
  end

  private
  def find_article
    @article = Article.find params[:id]
  end
end
