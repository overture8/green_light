require 'rails/generators'

module GreenLight
  class InstallGenerator < Rails::Generators::Base
    desc 'Generates config file for green_light'

    def self.source_root
      @source_root ||= File.join(File.dirname(__FILE__), 'templates')
    end

    def generate_config
      copy_file "green_light.yml", "config/green_light.yml"
    end

    def generate_initializer
      copy_file "green_light.rb", "config/initializers/green_light.rb"
    end
  end
end

