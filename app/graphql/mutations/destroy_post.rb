module Mutations
  class DestroyPost < BaseMutation
    argument :id, ID, required: true

    field :success, String, null: false
    field :errors, [String], null: false

    def resolve(id:)
      post = Post.find_by(id: id)

      if post.blank?
        return { success: false, errors: ["Post doesn't exist"] }
      end

      if post.destroy
        return { success: true, errors: [] }
      end

      { success: false, errors: post.errors.full_messages }
    end
  end
end
