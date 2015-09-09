require 'ffaker'

User.find_or_create_by email: 'hoge@hoge.com' do |user|
  user.name = FFaker::Name.name
  user.password = 'password'
  user.password_confirmation = 'password'
end

50.times do
  article = User.first.articles.create(
    title: FFaker::BaconIpsum.sentence,
    body:  FFaker::BaconIpsum.paragraph,
    posted_at: FFaker::Time.date
  )
  article.tag_list =  FFaker::BaconIpsum.words
  article.save
end
