require File.dirname(__FILE__) + '/spec_helper'

describe GreenLight do
  it "should return a valid json string when validating the format of a field" do
    rules = GreenLight::Rules.generate(['FormatOfModel'])
    expect(rules).to eq("{\"rules\":{\"format_of_model[title]\":{\"regex\":\"(\\\\A[A-Za-z]\\\\z)\"}},\"errorElement\":\"span\"}")
  end

  it "should return a json string when validating the presence of a field" do
    rules = GreenLight::Rules.generate(['PresenceOfModel'])
    expect(rules).to eq("{\"rules\":{\"presence_of_model[title]\":{\"required\":true}},\"errorElement\":\"span\"}")
  end

  it "should return a json string when validating the length of a field" do
    rules = GreenLight::Rules.generate(['LengthOfModel'])
    expect(rules).to eq("{\"rules\":{\"length_of_model[title]\":{\"minlength\":5,\"maxlength\":10}},\"errorElement\":\"span\"}")
  end

  it "should return a json string when validating the numericality of a field" do
    rules = GreenLight::Rules.generate(['NumericalityOfModel'])
    expect(rules).to eq("{\"rules\":{\"numericality_of_model[age]\":{\"regex\":\"^[0-9]*$\"}},\"errorElement\":\"span\"}")
  end

  it "should return a json string when validating the uniqueness of a field" do
    rules = GreenLight::Rules.generate(['UniquenessOfModel'])
    expect(rules).to eq("{\"rules\":{\"uniqueness_of_model[title]\":{\"remote\":\"/javascripts/check_for_uniqueness?model=UniquenessOfModel\\u0026field=title\"}},\"errorElement\":\"span\"}")
  end
end

class UniquenessOfModel
  include ActiveRecord::Validations
  validates_uniqueness_of :title
end

class FormatOfModel
  include ActiveModel::Model
  validates_format_of :title, :with => /\A[A-Za-z]\z/
end

class PresenceOfModel
  include ActiveModel::Model
  validates_presence_of :title
end

class LengthOfModel
  include ActiveModel::Model
  validates_length_of :title, :within => 5..10
end

class NumericalityOfModel
  include ActiveModel::Model
  validates_numericality_of :age
end


