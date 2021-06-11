module Types
  class PostType < Types::BaseObject
    include ActionView::Helpers::DateHelper
    include ActionView::Helpers::NumberHelper
    include ActionView::Helpers::TextHelper

    # Base fields
    field :id, ID, null: false
    field :content, String, null: false
    field :short_content, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false

    # associations
    field :user, Types::UserType, null: false
    field :attachments, [Types::AttachmentType], null: false
    field :comments, [Types::CommentType], null: false

    # Additional fields
    field :likes_count, String, null: false
    field :likes_count_label, String, null: false
    field :comments_count, Integer, null: false
    field :comments_count_label, String, null: false
    field :liked, Boolean, null: false
    field :created_at_label, String, null: false

    def likes_count
      object.likes.count
    end

    def likes_count_label
      pluralize(number_with_delimiter(object.likes.count), 'like')
    end

    def created_at_label
      "#{time_ago_in_words(object.created_at)} ago".upcase
    end

    def comments_count
      object.comments.count
    end

    def comments_count_label
      pluralize(number_with_delimiter(object.comments.count), 'comment')
    end

    def liked
      return false if context[:current_user].blank?

      context[:current_user].liked_post?(object.id)
    end

    def comments
      object.comments.last(2)
    end
  end
end
