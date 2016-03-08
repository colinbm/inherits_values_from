require 'inherits_values_from/version.rb'

module InheritsValuesFrom

  extend ActiveSupport::Concern

  module ClassMethods

    def inherits_values_from(model, values)
      values.each do |local, far|
        far = local if far.nil? # It's an array

        define_method(local) do
          if self[local].nil?
            self.method(model).call().method(far).call()
          else
            self[local]
          end
        end


        # # If a value is set explicitly to the same as the inherited value
        # # should we set this as null (inherit), or keep it specified?
        # #
        # define_method("#{local}=") do |value|
        #   if self.method(model).call[far] === value
        #     write_attribute(local, nil)
        #   else
        #     write_attribute(local, value)
        #   end
        # end


        define_method("#{local}_inherited") do
          self.method(model).call[far]
        end

      end
    end

  end

end

ActiveRecord::Base.send(:include, InheritsValuesFrom)
