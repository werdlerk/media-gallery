# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Media.destroy_all

user = User.create(email: 'koen@werdler.com', name: 'Koen', password: 'Puntenburgerlaan1-A')

(1..8).each do |i|
  Media.create(url: "http://brocknunn.com/untame/bootstrap-gallery/img/pics/#{i}.jpg", user: user)
end
(1..8).each do |i|
  Media.create(url: "http://brocknunn.com/untame/bootstrap-gallery/img/pics/#{i}.jpg", user: user )
end