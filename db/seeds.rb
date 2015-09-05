# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.find_or_create_by email: 'hoge@hoge.com' do |user|
  user.name = 'Hoge'
  user.password = 'password'
  user.password_confirmation = 'password'
end

User.find_or_create_by email: 'huga@huga.com' do |user|
  user.name = 'Huga'
  user.password = 'password'
  user.password_confirmation = 'password'
end
