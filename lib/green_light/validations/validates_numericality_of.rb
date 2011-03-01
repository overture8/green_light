module GreenLight
  module Validations
    module ValidatesNumericalityOf
      extend ActiveSupport::Concern

      module ClassMethods
        def numericality_validator(params = {})
          {:regex => "^[0-9]*$"}
        end
      end
    end
  end
end

