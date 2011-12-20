module GreenLight
  class Rules
    include Validations::ValidatesFormatOf
    include Validations::ValidatesLengthOf
    include Validations::ValidatesNumericalityOf
    include Validations::ValidatesPresenceOf
    include Validations::ValidatesUniquenessOf

    def self.generate(models)
      data, rules = {}, {}
      models.each do |model|
        model.constantize._validators.each do |field_name, validations|
          rules["#{model.to_s.underscore.downcase}[#{field_name}]"] = parse_each_validation(model, field_name, validations)
          data[:rules] = rules
        end
      end
      data.merge!({:errorElement => "span"})
      data.to_json
    end

    private
      def self.parse_each_validation(model, field_name, validation_objs)
        data, params = {}, {}
        params[:model], params[:field_name] = model, field_name
        validation_objs.each do |val_obj|
          params[:val_obj] = val_obj
          # Call each validation method
          validation_method = val_obj.class.name.split('::').last.underscore
          result = send(validation_method, params) if respond_to? validation_method
          data.merge!(result) unless result.nil?
        end
        data
      end
  end
end
