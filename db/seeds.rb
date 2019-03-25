Book.destroy_all
Checkout.destroy_all
User.destroy_all

user1 = User.create(name: "MJ Ch", bio: "Hi, my name is Merjen. I love reading memoirs and thrillers", review: "Awesome Book. Get it!")
user2 = User.create(name: Faker::Name.name, bio: Faker::Hacker.say_something_smart, review: Faker::Hacker.say_something_smart)
user3 = User.create(name: Faker::Name.name, bio: Faker::Hacker.say_something_smart, review: Faker::Hacker.say_something_smart)
user4 = User.create(name: Faker::Name.name, bio: Faker::Hacker.say_something_smart, review:Faker::Hacker.say_something_smart)
user5 = User.create(name: Faker::Name.name, bio: Faker::Hacker.say_something_smart, review: Faker::Hacker.say_something_smart)

book1 = Book.create(name: "Educated", author: "Tara Westover", price: 18.50, subject: "Memoir", rating: 5)
book2 = Book.create(name: Faker::Book.title, author: Faker::Book.author, price: Faker::Commerce.price , subject: Faker::Book.genre, rating: 4 )
book3 = Book.create(name: Faker::Book.title, author: Faker::Book.author, price: Faker::Commerce.price , subject: Faker::Book.genre, rating: 5)
book4 = Book.create(name: Faker::Book.title, author: Faker::Book.author, price: Faker::Commerce.price , subject: Faker::Book.genre, rating: 3)
book5 = Book.create(name: Faker::Book.title, author: Faker::Book.author, price: Faker::Commerce.price , subject: Faker::Book.genre, rating: 4)

 checkout1 = Checkout.create(book_id: Book.all.sample.id, user_id: User.all.sample.id)
 checkout2 = Checkout.create(book_id: Book.all.sample.id, user_id: User.all.sample.id)
 checkout3 = Checkout.create(book_id: Book.all.sample.id, user_id: User.all.sample.id)
 checkout4 = Checkout.create(book_id: Book.all.sample.id, user_id: User.all.sample.id)
 checkout5 = Checkout.create(book_id: Book.all.sample.id, user_id: User.all.sample.id)
 # checkout1 = Checkout.create(book_id: book1.id, user_id: user1.id)



# Book.create = (name:"Educated", author:"Tara Westover", price:10, subject:"memoir")
#User.create = (name: "MJ Ch")
