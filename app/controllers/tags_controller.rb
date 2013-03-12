class TagsController < ApplicationController
  respond_to :json
  def index
    render :json => Tag.all.map{|e| {'name' => e.name} }.to_json
  end
end
