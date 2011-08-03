config = YAML.load_file(File.join(Rails.root, 'config', 'green_light.yml'))
GREEN_LIGHT = HashWithIndifferentAccess.new(config)
