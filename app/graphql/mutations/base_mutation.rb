module Mutations
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    # argument_class Types::BaseArgument
    # field_class Types::BaseField
    # input_object_class Types::BaseInputObject
    # object_class Types::BaseObject

    # Mutation authorization example code
    # def ready?(**args)
    #   if context[:current_user].present?
    #     true
    #   else
    #     return false, { success: false, errors: ["You don't have permission to do this"] }
    #   end
    # end
  end
end
