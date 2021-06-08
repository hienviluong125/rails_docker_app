module Mutations
  class UpdatePost < BaseMutation
    argument :id, ID, required: true
    argument :attributes, Types::PostAttributes, required: true

    field :success, String, null: false
    field :post, Types::PostType, null: true
    field :errors, [String], null: false

    def resolve(id:, attributes:)
      post = Post.find_by(id: id)

      if post.blank?
        return { success: false, post: nil, errors: ["Post doesn't exist"] }
      end

      if post.update(attributes.to_h)
        return { success: true, post: post, errors: [] }
      end

      { success: false, post: nil, errors: post.errors.full_messages }
    end
  end
end
