class Article < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :tags
  attr_accessible :title, :article_type, :content

  default_scope :include => :tags

  class << self
    def collect params, user
      tags = Tag.get_tags_from params[:tags]
      article = user.articles.build(params[:article])
      article.tags = tags
      article.save
    end

  end

end
