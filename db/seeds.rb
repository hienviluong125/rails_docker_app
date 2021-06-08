# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

12.times do
  post = Post.create(
    content: FFaker::Lorem.sentences.join(' '),
    short_content: FFaker::Lorem.sentence,
  )

  attachment_a = Attachment.new
  attachment_a.remote_file_url = FFaker::Image.url
  attachment_a.save

  attachment_b = Attachment.new
  attachment_b.remote_file_url = FFaker::Image.url
  attachment_b.save

  post.update(attachment_ids: [attachment_b.id, attachment_a.id])
end
