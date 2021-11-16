# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
BookInOrder.delete_all
Order.delete_all
Province.delete_all
Customer.delete_all
BookGenre.delete_all
Book.delete_all
Author.delete_all
Genre.delete_all

Faker::UniqueGenerator.clear

NUMBER_OF_AUTHORS = 70
bookArray = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,3,3,4,11]
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
      authorName = Faker::Movies::StarWars.unique.character
    else
      authorName = Faker::TvShows::StarTrek.unique.character
    end
  rescue => exception
    authorName = Faker::Games::Fallout.unique.character
  end

  info = "lives in #{Faker::Games::Pokemon.location} with their #{rand(10) + 1} #{Faker::Creature::Animal.name}"
  author = Author.create(name: authorName, info: info)
  numberOfBooksWritten.times do
    Faker::Quote.unique.clear
    booktitle = "#{Faker::Book.unique.title} on #{Faker::TvShows::StarTrek.location} "
    description = %Q[ Critics have this to say about #{authorName} 's newest work: \n"#{Faker::Quote.unique.famous_last_words}"\n "#{Faker::Quote.unique.famous_last_words}"\n "#{Faker::Quote.unique.famous_last_words}"]
    newBook = author.books.create(name: booktitle, description: description, cost: Faker::Number.decimal(l_digits: 2) )
    numberOfGenre = genre_odds.sample

    numberOfGenre.times do
      genre = Genre.find_or_create_by(name:category_array.sample)
      BookGenre.create(book: newBook, genre: genre)
    end
  end
end
puts "Created #{Genre.count} genres"
puts "Created #{Author.count} authors"
puts "Created #{Book.count} books"









