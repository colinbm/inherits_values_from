require 'inherits_values_from/version.rb'

module InheritsValuesFrom
  
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    
    def inherits_values_from(model, values)
      values.each do |local, far|
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
