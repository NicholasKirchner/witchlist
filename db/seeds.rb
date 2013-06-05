require 'faker'

#make some categories

categories = [
  "Brooms", 
  "Witches & Wizards For Hire", 
  "Domeciles",
  "Spells",
  "Wands",
  "Potion Accessories",
  "Potion Supplies" 
]

categories.each do |category|
  Category.create(name: category)
end

column_names = ["author", "email", "price", "content", "key", "category_id"]

42.times do
  # Post.column_names --> get an array of all our column names
  # Make another array of corresponding things
  # zip into hash
  post_content = {
  :author => Faker::Name.name,
  :email => Faker::Internet.email,
  :price => rand(1..10000),
  :content => Faker::Lorem.paragraph,
  :key => SecureRandom.hex(10),
  :category_id => rand(1..7)
  }

  Post.create(post_content)
end
