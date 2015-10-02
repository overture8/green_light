module GreenLight
  module Validations
    module ValidatesFormatOf
      extend ActiveSupport::Concern

      module ClassMethods
        def format_validator(params = {})
          {:regex => "#{params[:val_obj].options[:with]}".gsub('?-mix:', '').gsub('\\A', '^').gsub('\\z', '$')}
        end
      end
    end
  end
end

