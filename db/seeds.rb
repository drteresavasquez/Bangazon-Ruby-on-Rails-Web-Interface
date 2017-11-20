
# create 100 users
100.times do |num|
    first_name = Faker::Name.unique.first_name
    last_name  = Faker::Name.unique.first_name
    address = Faker::Address.street_address
    city = Faker::Address.city
    state = Faker::Address.state_abbr
    zip = Faker::Address.zip_code
    phone = Faker::PhoneNumber.cell_phone
    email = "#{first_name}@example.com"
    password = '123456'

    User.create!(
        first_name: first_name,
        last_name: last_name,
        address: address,
        city: city,
        state: state,
        zip: zip,
        phone: phone,
        email: email,
        password: password,
        password_confirmation: password
      )
end

# create 10 categories
10.times do |num|
  category_name = Faker::Commerce.department
  Category.create!(
      category_name: category_name
    )
end

# create 500 products
500.times do |num|
  seller_id = rand(1..100)
  price = Faker::Commerce.price
  local = random_boolean = [true, false].sample
  category_id = rand(1..10)
  exp_date = Faker::Date.forward(50)
  description = Faker::Lorem.sentence
  quantity = rand(1..50)
  active = random_boolean = [true, false].sample
  product_name = Faker::Commerce.product_name
  Product.create!(
      seller_id: seller_id,
      price: price,
      local: local,
      category_id: category_id,
      exp_date: exp_date,
      description: description,
      quantity: quantity,
      active: active,
      product_name: product_name
    )
end

# create 100 payment types
#select from 10 account names
account_names = Array.new
10.times do
  account_names.push(Faker::Bank.name)
end

100.times do |num|
  user_id = num
  account_name = account_names.select
  account_number = rand(111..999)
  exp_date = Faker::Date.forward(365)
  PaymentType.create!(
      user_id: user_id,
      account_name: account_name,
      account_number: account_number,
      exp_date: exp_date
    )
end

# create 500 orders
500.times do
  user_id = rand(1..100)
  payment_type_id = rand(1..100)
  active = true

  Order.create!(
      user_id: user_id,
      payment_type_id: payment_type_id,
      active: active
    )
end
