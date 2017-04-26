require 'random_data'

20.times do
  Wiki.create!(
    title: RandomData.random_sentence,
    body:  RandomData.random_paragraph
  )
end
wikis = Wiki.all

puts "Seed Finished"
puts "#{Wiki.count} posts created"
