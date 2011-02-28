module GreenLight
  module Validations
    module ValidatesPresenceOf
      extend ActiveSupport::Concern

      module ClassMethods
        def presence_validator(params = {})
          {:required => true}
        end
      end
    end
  end
end

