class Seed

  def self.begin
    seed = Seed.new
    seed.generate_products
    seed.create_admin
  end

  def generate_products
    20.times do |i|
      Product.create!(name: Faker::Lorem.word, price: rand(10...100), description: Faker::Lorem.sentence(5, false, 0).chop)
    end
  end

  def create_admin
    User.create!(name: "Admin", email: "admin@email.com", password: "password", admin: true)
  end
end

Seed.begin
