require 'spec_helper'

describe Tag do
  describe ".get_tags_from" do
    it "should parse arr_string to tags" do
      Tag.count.should == 0
      Tag.get_tags_from('=program, @ruby, -meta')
      Tag.count.should == 3
    end

    it "should not create exist tags" do
      Tag.create :name => '=program'
      Tag.count.should == 1
      Tag.get_tags_from('=program, @ruby, -meta').size.should == 3
      Tag.count.should == 3
    end
  end
end
