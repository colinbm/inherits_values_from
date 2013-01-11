require 'inherits_values_from/version.rb'

module InheritsValuesFrom
  
  extend ActiveSupport::Concern
  
  module ClassMethods
    
    def inherits_values_from(model, values)
      values.each do |local, far|
        far = local if far.nil? # It's an array
        define_method(local) do
          if self[local].nil?
            self.method(model).call[far]
          else
            self[local]
          end
        end
      end
    end
    
  end
  
end

ActiveRecord::Base.send(:include, InheritsValuesFrom)