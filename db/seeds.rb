# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user_deetz = [
{email: 'test@test.com', name: 'Luke'},
{email: 'banana@ba.na', name: 'Bana'},
{email: 'fake@very.fake', name: 'Fayk'}

]
user_deetz.each do |user|
  User.create(user)
end

puts 'users seeded'
user_ids = User.all.collect{|u| u.id}

link_deetz = [
  {url:'http://www.google.com',digger_id: user_ids.sample, title: 'google'},
  {url:'http://www.reddit.com',digger_id: user_ids.sample, title: 'reddit'},
  {url:'http://www.facebook.com',digger_id: user_ids.sample, title: 'facebook'},
  {url:'http://www.npr.com',digger_id: user_ids.sample, title: 'npr'},
  {url:'http://www.bing.com',digger_id: user_ids.sample, title: 'bing'},
  {url:'http://www.zombo.com/',digger_id: user_ids.sample, title: 'zombo'},
  {url:'http://www.youtube.com',digger_id: user_ids.sample, title: 'youtube'}
]


link_deetz.each do |link|
  Link.create(link)
end

puts 'links seeded'
link_ids = Link.all.collect{|l| l.id}

pile_deetz = [
  {user_id: user_ids.sample, link_id: link_ids.sample},
  {user_id: user_ids[0], link_id: link_ids[0]},
  {user_id: user_ids[1], link_id: link_ids[0]},
  {user_id: user_ids[1], link_id: link_ids[2]}
]

pile_deetz.each do |pile|
  Pile.create(pile)
end

puts 'piles seeded'

