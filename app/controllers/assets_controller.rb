class AssetsController < ApplicationController
  respond_to :js

  def green_light
    @rules = GreenLight::Rules.generate(all_models)
    respond_with(@rules)
  end

  private
    def all_models
      tables = ActiveRecord::Base.connection.tables
      tables.delete("schema_migrations")
      tables.map { |table| table.camelize.singularize.constantize }
    end
end
