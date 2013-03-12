class MainController < ApplicationController
  def index
    @tags = Tag.all
  end
end
