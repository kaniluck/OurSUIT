FactoryBot.define do
  factory :post do
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')) }
    title { Faker::Lorem.characters(number:30) }
    user # アソシエーション
  end
end