# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#   Character.create(name: 'Luke', movie: movies.first)
unless Product.count > 0
    Product.create!(
      title: "Hoodie", description: "An awesome hoodie!", price: 23.45,
      photo: "http://res.cloudinary.com/deruwllkv/image/upload/v1565141088/a6usehtmcxhskup7cmex.png",
      size: "L",
      color: "Red",
      category: "men")
end
