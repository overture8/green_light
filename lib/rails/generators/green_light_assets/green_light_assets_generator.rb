require 'rails/generators'

class GreenLightAssetsGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def generate_assets
    unless File.exists?("public/javascripts/jquery.validate.min.js")
      copy_file "jquery.validate.min.js", "public/javascripts/jquery.validate.min.js"
    else
      puts "public/javascripts/jquery.validate.min.js already exists."
    end

    unless File.exists?("public/javascripts/jquery.validate_regex.js")
      copy_file "jquery.validate_regex.js", "public/javascripts/jquery.validate_regex.js"
    else
      puts "public/javascripts/jquery.validate_regex.js already exists."
    end
    
    unless File.exists?("public/javascripts/jquery-1.4.4.min.js")
      copy_file "jquery-1.4.4.min.js", "public/javascripts/jquery-1.4.4.min.js"
    else
      puts "public/javascripts/jquery-1.4.4.min.js already exists."
    end
    puts ""
    puts "Insert the following code in your layout header"
    puts ""
    puts "<%= javascript_include_tag 'jquery-1.4.4.min', 'jquery.validate.min', 'jquery.validate_regex', 'green_light' %>"
    puts ""
  end
end
