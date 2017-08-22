# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all


User.create(id: 1, username: Faker::Name.name)
User.create(id: 2, username: Faker::Name.name)
User.create(id: 3, username: 'Porfy Matias')
User.create(id: 4, username: Faker::Name.name)

ArtworkShare.create(id: 1, artwork_id: 2, viewer_id: 3)
ArtworkShare.create(id: 3, artwork_id: 1, viewer_id: 1)
ArtworkShare.create(id: 4, artwork_id: 4, viewer_id: 2)
ArtworkShare.create(id: 5, artwork_id: 5, viewer_id: 4)

Artwork.create(id: 1, title: 'The Winds of Winter', image_url: 'http://www.darkmediaonline.com/wp-content/uploads/2013/01/WindsofWinter.jpg', artist_id: 3)
Artwork.create(id: 2, title: 'A Storm of Swords', image_url: 'http://www.darkmediaonline.com/wp-content/uploads/2013/01/WindsofWinter.jpg', artist_id: 2)
Artwork.create(id: 3, title: 'A Game of Thrones', image_url: 'http://www.darkmediaonline.com/wp-content/uploads/2013/01/WindsofWinter.jpg', artist_id: 1)
Artwork.create(id: 4, title: 'Hardhome', image_url: 'http://www.darkmediaonline.com/wp-content/uploads/2013/01/WindsofWinter.jpg', artist_id: 3)
Artwork.create(id: 5, title: 'The Watchers on the Wall', image_url: 'http://www.darkmediaonline.com/wp-content/uploads/2013/01/WindsofWinter.jpg', artist_id: 1)
