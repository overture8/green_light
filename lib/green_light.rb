require 'active_support/all'
require File.join(File.dirname(__FILE__), 'green_light/engine')

module GreenLight
  autoload :Rules,                          'green_light/rules'

  module Validations
    autoload :ValidatesFormatOf,            'green_light/validations/validates_format_of'
    autoload :ValidatesLengthOf,            'green_light/validations/validates_length_of'
    autoload :ValidatesNumericalityOf,      'green_light/validations/validates_numericality_of'
    autoload :ValidatesPresenceOf,          'green_light/validations/validates_presence_of'
    autoload :ValidatesUniquenessOf,        'green_light/validations/validates_uniqueness_of'
  end
end
