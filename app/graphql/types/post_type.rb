module Types
  class PostType < Types::BaseObject
    # Base fields
    field :id, ID, null: false
    field :content, String, null: false
    field :short_content, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false

    # associations
    field :user, GraphQL::Types::JSON, null: false
    field :attachments, [Types::AttachmentType], null: false
    field :comments, [GraphQL::Types::JSON], null: false

    # Additional fields
    field :likes_count, String, null: false
    field :likes_count_label, String, null: false
    field :comments_count, Integer, null: false
    field :comments_count_label, String, null: false
    field :liked, Boolean, null: false
    field :created_at_label, String, null: false

    # TODO: 1 post should belong to one user
    def user
      {
        displayName: "Ruby on Rails Foundation",
        avatar: {
          attachmentType: 'image',
          url: 'https://pbs.twimg.com/media/CZGHPChUAAA3jqE.png'
        }
      }
    end

    # TODO: 1 post should has many comments
    def comments
      [
        {
          user: {
            displayName: 'Alex',
          },
          content: 'Interesting It is a long established fact that a reader',
          createdAt: Date.new,
          createdAtLabel: '17 hours ago'
        },
        {
          user: {
            displayName: 'John',
          },
          content: 'Lorem',
          createdAt: Date.new,
          createdAtLabel: '30 minutes ago'
        }
      ]
    end

    def likes_count
      2000
    end

    def likes_count_label
      "2,000 likes"
    end

    def created_at_label
      "2 DAYS AGO"
    end

    def comments_count
      1675
    end

    def comments_count_label
      "1,675 comments"
    end

    def liked
      [true, false].sample
    end
  end
end
