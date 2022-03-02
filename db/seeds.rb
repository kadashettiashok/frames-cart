# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do |user|
    User.create!(
      name: "softsuave #{user}",
      email: "softsuave#{user}@gmail.com",
      password: "123456",
      role: 'user',
      currency: "USD"
    )
  end
  puts '3 Users created!'
  


  3.times do |frame|
    Frame.create!(
      name: "frame #{frame}",
      description: "description#{proj}",
      status: "active",
      stock: 10,
      price: 20
    )
  end
  puts '3 Frames created!'



  3.times do |lens|
    Frame.create!(
      name: "lens #{lens}",
      description: "description",
      prescription_type: "fashion",
      lens_type: "classic"
      stock: 15,
      price: 30
    )
  end
  puts '3 Frames created!'

  


