require File.dirname(__FILE__) + '/spec_helper'

describe GreenLight do
  before(:all) do
  end
      
  it "should return a valid json string when validating the format of a field" do
    rules = GreenLight::Rules.generate([FormatOfModel])
    rules.should == "{\"errorElement\":\"span\",\"rules\":{\"format_of_model[title]\":{\"regex\":\"(^[A-Za-z]$)\"}}}"
  end

  it "should return a json string when validating the presence of a field" do
    rules = GreenLight::Rules.generate([PresenceOfModel])
    rules.should == "{\"errorElement\":\"span\",\"rules\":{\"presence_of_model[title]\":{\"required\":true}}}"
  end
end

class FormatOfModel < SuperModel::Base
  validates_format_of :title, :with => /^[A-Za-z]$/
end

class PresenceOfModel < SuperModel::Base
  validates_presence_of :title
end
