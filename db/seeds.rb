

20.times do
  Wiki.create!(
    title: Faker::Hipster.sentence,
    body:  Faker::Hipster.paragraph(2)
  )
end
wikis = Wiki.all

puts "Seed Finished"
puts "#{Wiki.count} posts created"
