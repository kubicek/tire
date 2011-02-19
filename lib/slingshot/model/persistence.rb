module Slingshot
  module Model

    module Persistence

      def self.included(base)

        base.class_eval do
          include ActiveModel::AttributeMethods
          include ActiveModel::Validations
          include ActiveModel::Serialization
          include ActiveModel::Serializers::JSON
          include ActiveModel::Naming

          extend  ActiveModel::Callbacks
          define_model_callbacks :save, :destroy

          extend  Slingshot::Model::Naming::ClassMethods
          include Slingshot::Model::Naming::InstanceMethods

          extend  Persistence::Finders::ClassMethods
          include Persistence::Attributes::InstanceMethods

          include Persistence::Storage

          def self.mode
            :persistable
          end

        end

      end

    end

  end
end