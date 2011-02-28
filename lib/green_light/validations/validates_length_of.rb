module GreenLight
  module Validations
    module ValidatesLengthOf
      extend ActiveSupport::Concern

      module ClassMethods
        def length_validator(params = {})
          min, max = {}, {}
          min = {:minlength => params[:val_obj].options[:minimum]} if params[:val_obj].options[:minimum]
          max = {:maxlength => params[:val_obj].options[:maximum]} if params[:val_obj].options[:maximum]
          min.merge!(max)
        end
      end
    end
  end
end
