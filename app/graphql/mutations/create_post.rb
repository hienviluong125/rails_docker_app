module Mutations
  class CreatePost < BaseMutation
    argument :attributes, Types::PostAttributes, required: true

    field :success, String, null: false
    field :post, Types::PostType, null: true
    field :errors, [String], null: false

    def resolve(attributes:)
      post = Post.new(attributes.to_h)

      if post.save
        return { success: true, post: post, errors: [] }
      end

      { success: false, post: nil, errors: post.errors.full_messages }
    end
  end
end
