Book.destroy_all
Checkout.destroy_all
User.destroy_all

merjench = User.create(name: "MJ Ch", bio: "Hi, my name is Merjen. I love reading memoirs and thrillers")
user2 = User.create(name: Faker::Name.name, bio: Faker::Hacker.say_something_smart)
user3 = User.create(name: Faker::Name.name, bio: Faker::Hacker.say_something_smart)
user4 = User.create(name: Faker::Name.name, bio: Faker::Hacker.say_something_smart)
user5 = User.create(name: Faker::Name.name, bio: Faker::Hacker.say_something_smart)

book1 = Book.create(name: "Educated", author: "Tara Westover", price: 18.50, subject: "Memoir")
book2 = Book.create(name: Faker::Book.title, author: Faker::Book.author, price: Faker::Commerce.price , subject: Faker::Book.genre)
book3 = Book.create(name: Faker::Book.title, author: Faker::Book.author, price: Faker::Commerce.price , subject: Faker::Book.genre)
book4 = Book.create(name: Faker::Book.title, author: Faker::Book.author, price: Faker::Commerce.price , subject: Faker::Book.genre)
book5 = Book.create(name: Faker::Book.title, author: Faker::Book.author, price: Faker::Commerce.price , subject: Faker::Book.genre)

checkout1 = Checkout.create(book_id: Book.all.sample.id, user_id: User.all.sample.id)
checkout2 = Checkout.create(book_id: Book.all.sample.id, user_id: User.all.sample.id)
checkout3 = Checkout.create(book_id: Book.all.sample.id, user_id: User.all.sample.id)
checkout4 = Checkout.create(book_id: Book.all.sample.id, user_id: User.all.sample.id)
checkout5 = Checkout.create(book_id: Book.all.sample.id, user_id: User.all.sample.id)
Checkouts.create = (book_id: Book.find_by((name:"Educated", author:"Tara Westover", price:10, subject:"memoir").id)



# Book.create = (name:"Educated", author:"Tara Westover", price:10, subject:"memoir")
#User.create = (name: "MJ Ch")
