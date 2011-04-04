require 'rails/generators'

class GreenLightAssetsGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def generate_assets
    unless File.exists?("public/javascripts/jquery.validate_regex.js")
      copy_file "jquery.validate_regex.js", "public/javascripts/jquery.validate_regex.js"
    else
      puts "public/javascripts/jquery.validate_regex.js already exists."
    end
    
    puts "Nearly there!  Just download the jQuery Validate plugin (http://jquery.bassistance.de/validate/jquery-validation-1.8.0.zip)"
    puts "and jQuery 1.3.2, 1.4.2, 1.4.4, 1.5.0, 1.5.1."
    puts ""
    puts "Include the above in your layout header."
    puts ""
    puts "Also, insert the following code in your layout header"
    puts ""
    puts "<%= javascript_include_tag 'jquery.validate_regex', 'green_light' %>"
    puts ""
  end
end
