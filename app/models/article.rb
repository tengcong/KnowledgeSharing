class Article < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :tags
  attr_accessible :title, :article_type, :content

  default_scope :include => :tags
  scope :desc, order("updated_at DESC")

  class << self
    def collect params, user
      tags = Tag.get_tags_from params[:tags]
      article = user.articles.build(params[:article])
      article.tags = tags
      article.save
    end

    def renderer
      @renderer ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML,
        :autolink => true, :space_after_headers => true)
    end
  end

  def update_article article_attr, tags
    self.update_attributes article_attr
    self.tags = Tag.get_tags_from(tags)
    self.save
  end

  def destroy_with_orphan_tags
    tags.select{|tag| tag.articles.size == 1 }.map{|t| t.destroy}
    self.destroy
  end

  def as_json(options={})
    {
      :id => self.id,
      :title => self.title,
      :article_type => self.article_type,
      :content => self.content,
      :tags => self.tags.map{|t| t.name}.join(', '),
      :user_id => self.user.id
    }
  end
end
