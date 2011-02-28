module GreenLight
  module Validations
    module ValidatesUniquenessOf
      extend ActiveSupport::Concern

      module ClassMethods
        def uniqueness_validator(params = {})
          { :remote => "/javascripts/check_for_uniqueness?model=#{params[:model].to_s}&field=#{params[:field_name]}" }
        end
      end
    end
  end
end
