class JavascriptsController < ApplicationController
  respond_to :js, :text

  def green_light
    @rules = GreenLight::Rules.generate(all_models)
    respond_with(@rules)
  end

  def check_for_uniqueness
    record = params[:model].constantize.where("#{params[:field]} = ?", params[params[:model].downcase.underscore][params[:field]])
    if record.count > 0
      render :text => "\"#{params[params[:model].downcase.underscore][params[:field]]} is already taken.\""
    else
      render :text => true
    end
  end

  private
    def all_models
      tables = ActiveRecord::Base.connection.tables
      tables.delete("schema_migrations")
      tables.map { |table| table.camelize.singularize.constantize }
    end
end
