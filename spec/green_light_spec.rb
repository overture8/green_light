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

  it "should return a json string when validating the length of a field" do
    rules = GreenLight::Rules.generate([LengthOfModel])
    rules.should == "{\"errorElement\":\"span\",\"rules\":{\"length_of_model[title]\":{\"maxlength\":10,\"minlength\":5}}}"
  end

  it "should return a json string when validating the numericality of a field" do
    rules = GreenLight::Rules.generate([NumericalityOfModel])
    rules.should == "{\"errorElement\":\"span\",\"rules\":{\"numericality_of_model[age]\":{\"regex\":\"^[0-9]*$\"}}}"
  end

  it "should return a json string when validating the uniqueness of a field" do
    rules = GreenLight::Rules.generate([UniquenessOfModel])
    rules.should == "{\"errorElement\":\"span\",\"rules\":{\"uniqueness_of_model[title]\":{\"remote\":\"/javascripts/check_for_uniqueness?model=UniquenessOfModel&field=title\"}}}"
  end
end

class FormatOfModel < SuperModel::Base
  validates_format_of :title, :with => /^[A-Za-z]$/
end

class PresenceOfModel < SuperModel::Base
  validates_presence_of :title
end

class LengthOfModel < SuperModel::Base
  validates_length_of :title, :within => 5..10
end

class NumericalityOfModel < SuperModel::Base
  validates_numericality_of :age
end

class UniquenessOfModel < SuperModel::Base
  validates_uniqueness_of :title
end
