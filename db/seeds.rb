

20.times do
  Wiki.create!(
    title: Faker::Lorem.sentence,
    body:  Faker::Lorem.paragraph(2)
  )
end
wikis = Wiki.all

puts "Seed Finished"
puts "#{Wiki.count} posts created"
