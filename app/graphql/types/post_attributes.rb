module Types
  class PostAttributes < Types::BaseInputObject
    description "Attributes for creating or updating a post"
    argument :content, String, "Content of the post", required: true
    argument :short_content, String, "Short content of the post", required: true
  end
end
