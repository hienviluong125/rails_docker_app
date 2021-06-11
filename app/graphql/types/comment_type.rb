module Types
  class CommentType < Types::BaseObject
    include ActionView::Helpers::DateHelper

    field :id, ID, null: false
    field :user, Types::UserType, null: false
    field :content, String, null: false
    field :short_content, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :created_at_label, String, null: false

    def created_at_label
      "#{time_ago_in_words(object.created_at)} ago"
    end
  end
end
