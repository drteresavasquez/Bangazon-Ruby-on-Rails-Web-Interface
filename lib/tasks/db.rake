namespace :db do
  desc "Drop, create, migrate, and repopulate with sample data"
  task repopulate: [:drop, :create, :migrate, :fakeit] do
    puts "Done"
  end

  desc "Generate dummy data"
  task fakeit: :environment do
    50.times do
      User.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        address: Faker::Address.street_address, 
        city: Faker::Address.city, 
        state: Faker::Address.state_abbr, 
        zip: Faker::Address.zip_code, 
        phone: Faker::PhoneNumber.phone_number,
        email: Faker::Internet.email
      )
    end
    
    Category.create!([
      {category_name: "Artwork"},
      {category_name: "Books"},
      {category_name: "Vintage"},
      {category_name: "Clothing"},
      {category_name: "Other"}
    ])
    
    50.times do
      Order.create!(
        user_id: Faker::Number.between(1, 50),
        active: Faker::Boolean.boolean
      )
    end

    200.times do
      PaymentType.create!(
        user_id: Faker::Number.between(1, 50),
        account_name: Faker::Business.credit_card_type,
        account_number: Faker::Business.credit_card_number,
        exp_date: Faker::Business.credit_card_expiry_date,
      )
    end

    500.times do
      Product.create!(
        seller_id: Faker::Number.between(1, 50),
        price: Faker::Number.decimal(2),
        category_id: Faker::Number.between(1, 4),
        local: Faker::Boolean.boolean,
        exp_date: Faker::Date.forward(60),
        # description: Faker::Movie.quote,
        quantity: Faker::Number.between(1, 20),
        active: Faker::Boolean.boolean,
        product_name: Faker::Commerce.product_name
      )
    end

    1000.times do
      OrdersProduct.create!(
        order_id: Faker::Number.between(1, 50),
        product_id: Faker::Number.between(1, 500)
      )
    end

    100.times do
      WishList.create!(
        user_id: Faker::Number.between(1, 50),
        wishlist_name: Faker::Book.title
      )
    end

    1000.times do
      WishListProduct.create!(
        wishlist_id: Faker::Number.between(1, 100),
        product_id: Faker::Number.between(1, 500)
      )
    end

  end

end
