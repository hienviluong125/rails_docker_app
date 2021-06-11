# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

3.times do
  user = User.create!(
    display_name: FFaker::Name.name,
    email: FFaker::Internet.email,
    password: "password"
  )

  attachment_avatar = Attachment.new
  attachment_avatar.remote_file_url = FFaker::Image.url
  attachment_avatar.save!

  user.avatar = attachment_avatar
  user.save!

end

10.times do
  rd_user_id = User.pluck(:id).sample
  post = Post.create!(
    content: FFaker::Lorem.sentences.join(' '),
    user_id: rd_user_id
  )

  attachment_a = Attachment.new
  attachment_a.remote_file_url = FFaker::Image.url
  attachment_a.save!

  attachment_b = Attachment.new
  attachment_b.remote_file_url = FFaker::Image.url
  attachment_b.save!

  post.update!(attachment_ids: [attachment_b.id, attachment_a.id])

  Like.create(user_id: User.where.not(id: rd_user_id).pluck(:id).sample, post_id: post.id)

  Comment.create(
    user_id: User.where.not(id: rd_user_id).pluck(:id).sample,
    post_id: post.id,
    content: FFaker::Lorem.sentences.join(' '),
  )

  Comment.create(
    user_id: User.where.not(id: rd_user_id).pluck(:id).sample,
    post_id: post.id,
    content: FFaker::Lorem.sentences.join(' '),
  )
end

puts "Done !!!"
