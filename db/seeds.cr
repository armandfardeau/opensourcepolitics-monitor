require "faker"
require "../config/application.cr"

100.times do
  Instance.create!(
  name: Faker::Hacker.adjective,
  picture: Faker::Avatar.image,
  url: Faker::Internet.url,
  repo: Faker::Internet.url
  )
end
