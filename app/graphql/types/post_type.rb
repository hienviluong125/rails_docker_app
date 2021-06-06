module Types
  class PostType < Types::BaseObject
    field :id, ID, null: false
    field :content, String, null: false
    field :short_content, String, null: false

    # Json type example
    # field :label, GraphQL::Types::JSON, null: false
    #
    # def label
    #   {
    #     aa: "aaaa",
    #     bb: "bbbb",
    #   }
    # end
  end
end
