module GreenLight #:nodoc:
  class Engine < ::Rails::Engine #:nodoc:

    config.to_prepare do
      GreenLight.define_singleton_method :validatable_models do
        ActiveRecord::Base.subclasses.map(&:to_s)
      end
    end

  end
end
