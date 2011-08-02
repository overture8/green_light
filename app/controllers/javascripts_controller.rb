class JavascriptsController < ApplicationController
  respond_to :text

  def check_for_uniqueness
    record = params[:model].constantize.where("#{params[:field]} = ?", params[params[:model].downcase.underscore][params[:field]])
    if record.count > 0
      render :text => "\"#{params[params[:model].downcase.underscore][params[:field]]} is already taken.\""
    else
      render :text => true
    end
  end
end
