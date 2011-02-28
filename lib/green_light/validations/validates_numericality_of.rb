module GreenLight
  module Validations
    module ValidatesNumericalityOf
      extend ActiveSupport::Concern

      module ClassMethods
        def numericality_validator(params = {})
          {:regex => "^[1-9]*$"}
        end
      end
    end
  end
end

