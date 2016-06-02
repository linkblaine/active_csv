require 'csv'
require 'faker'

soft_good_props = %w[id type brand description]
brand_props = %w[id name address]

brands = [
  Faker::Lorem.word,
  Faker::Lorem.word,
  Faker::Lorem.word,
  Faker::Lorem.word,
  Faker::Lorem.word
]

soft_goods = %w[t-shirt hoodie jacket pants gloves] 

CSV.open('./data/brands.csv', 'w+') do |csv|
  csv << brand_props
  brands.each do |brand|
    csv << [Faker::Number.number(4), brand, Faker::Address.street_address]
  end
end

CSV.open('./data/soft_goods.csv', 'w+') do |csv|
  csv << soft_good_props
  20.times do |t|
    csv << [Faker::Number.number(4), soft_goods.sample, brands.sample, Faker::Lorem.sentence]
  end
end

