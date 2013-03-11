class Tag < ActiveRecord::Base
  has_and_belongs_to_many :articles
  attr_accessible :name

  class << self
    def get_tags_from tags_string
      tag_names = parse_tags_string(tags_string)
      create_new_tags_in tag_names
      find_tags_with_names(tag_names)
    end

    def parse_tags_string tags_string
      tags_string.split(',').map{|tag| tag.gsub(/\s+/, '')}
    end

    def create_new_tags_in(tags)
      tags.select{|tag| Tag.where(:name => tag).empty?}.map{|tag| Tag.create(:name => tag)}
    end

    def find_tags_with_names(names)
      [].tap{|res| names.map{|name| res.push Tag.where(:name => name).first}}
    end
  end
end
