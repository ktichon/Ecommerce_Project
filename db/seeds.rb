# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
BookInOrder.delete_all
Order.delete_all
User.delete_all
Customer.delete_all
BookGenre.delete_all
Book.delete_all
Author.delete_all
Genre.delete_all
Province.delete_all
ActiveStorage::Attachment.all.each { |attachment| attachment.purge }


file_name = Rails.root.join("db/ProvincesCSV.csv")
puts "Loading Provinces from CSV file: #{file_name}"
csv_data = File.read(file_name)
province_list = CSV.parse(csv_data, headers: true, encoding: "utf-8")
province_list.each do |province|
  Province.create(name: province["name"], abbrev: province["abbrev"], PST: province["PST"], GST: province["GST"], HST: province["HST"])
end

Faker::UniqueGenerator.clear
NUMBER_OF_AUTHORS = 70
bookArray = [1,1,1,1,1,1,1,1,1,2,2,2,2,2,3,3,4,11]
NUMBER_OF_CATEGORIES = 10
category_array = []
genre_odds = [1,1,1,2]
NUMBER_OF_CATEGORIES.times do
  category_array.push(Faker::Book.unique.genre)
end

NUMBER_OF_AUTHORS.times do
  numberOfBooksWritten = bookArray.sample
  authorName = ""
  begin
    if numberOfBooksWritten == 1
      authorName = Faker::TvShows::StarTrek.unique.character
    elsif numberOfBooksWritten == 2
      authorName = Faker::Games::Fallout.unique.character
    elsif numberOfBooksWritten == 3
      authorName = Faker::Movies::PrincessBride.unique.character
    elsif  numberOfBooksWritten == 4
      authorName = Faker::Games::SuperSmashBros.unique.fighter
    else
      authorName = Faker::Movies::StarWars.unique.character
    end

  rescue => exception
    authorName = Faker::TvShows::BojackHorseman.unique.character
  end


  info = "#{authorName} lives in #{Faker::Games::Pokemon.location} with their #{rand(10) + 1} #{Faker::Creature::Animal.name}"
  author = Author.create(name: authorName, info: info)
  numberOfBooksWritten.times do
    Faker::Quote.unique.clear
    realBookTitle = Faker::Book.unique.title
    booktitle = "#{realBookTitle} on #{Faker::TvShows::StarTrek.location} "
    description = %Q[ Critics have this to say about #{authorName} 's newest work: \n"#{Faker::Quote.unique.famous_last_words}" - #{Faker::Company.unique.name}\n"#{Faker::Quote.unique.famous_last_words}" - #{Faker::Company.unique.name}\n"#{Faker::Quote.unique.famous_last_words}" - #{Faker::Company.unique.name}]
    newBook = author.books.create(name: booktitle, description: description, cost: Faker::Number.decimal(l_digits: 2) )
    numberOfGenre = genre_odds.sample

    numberOfGenre.times do
      genre = Genre.find_or_create_by(genre_name: category_array.sample)
      BookGenre.create(book: newBook, genre: genre)
    end

    query = URI.encode_www_form_component(realBookTitle)
    downloaded_image = URI.open("https://source.unsplash.com/300x300/?#{query}")
    newBook.image.attach(io: downloaded_image, filename: "m-#{booktitle}.jpg")
    sleep 1


  end
end
#AdminUser.create!(email: 'notadmin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
puts "Created #{Province.count} provinces"
puts "Created #{Genre.count} genres"
puts "Created #{Author.count} authors"
puts "Created #{Book.count} books"