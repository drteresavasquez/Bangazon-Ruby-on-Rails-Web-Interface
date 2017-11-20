
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

category_names = Array.new

10.times do |num|
  category_name = Faker::Commerce.department
  Category.create!(
      category_name: category_name
    )

  category_names.push(category_name)

end

puts category_names
