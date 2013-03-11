class ArticlesController < ApplicationController
  respond_to :json
  def create
    Rails.logger.info params

    # Article.create params[:article]
    Article.collect params, current_user
  end

  def index
    @articles = Article.all
  end
end
