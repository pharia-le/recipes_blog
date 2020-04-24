Category.create(name: "Breakfast")
Category.create(name: "Lunch")
Category.create(name: "Dinner")
Category.create(name: "Dessert")
Category.create(name: "Drinks")

20.times do 
    User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Internet.username, email: Faker::Internet.email, password: "password" )
end

100.times do
    Recipe.create(name: Faker::Food.dish, ingredients: [Faker::Food.ingredient, Faker::Food.ingredient, Faker::Food.ingredient, Faker::Food.ingredient], user_id: rand(20), category_id: rand(4))
end