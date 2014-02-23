require 'csv'

module LandingCat
  module Csvable
    extend ActiveSupport::Concern

    included do
      extend( ClassMethods )
    end

    module ClassMethods

      def attribute_keys
        return self.new.attributes.keys.sort.map { |name| name.to_sym }
      end

      def to_csv( objects )

        CSV.generate(:force_quotes => true ) do |csv|
          csv << attribute_keys

          objects.sort{ |a,b| a.id <=> b.id }.each do |object|
            csv << attribute_keys.inject( [] ) do |row, attribute|
              row << object.send( attribute )
             end
          end
        end
      end
    end

  end
end
