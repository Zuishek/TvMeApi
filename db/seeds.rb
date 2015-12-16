# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create(f_name: 'Ahmed', l_name: 'Diaby', gender: 1, username: 'Diabox', email: "user@example.com", password: 'password')
user2 = User.create(f_name: 'Karim', l_name: 'Taha', gender: 1, username: 'AboSenna', email: "user2@example.com", password: 'password')

wall1 = Wall.create(user: user1)

post1 = Post.create(show_name: 'Friends', text: "Friends is byfar the best show.", user: user1, wall: wall1, username: "Mohamed El-Alfy", email: "mohamed@gmail.com")
post2 = Post.create(show_name: 'HIMYM', text: "HIMYM is not the best show.", user: User.first, wall: Wall.first, username: "Mohamed El-Alfy", email: "mohamed@gmail.com")
comment1 = Comment.create(text: "Yes I agree.", user: user2, post: post1)

#curl http://localhost:3000/token -H 'Authorization: Basic dXNlcjJAZXhhbXBsZS5jb206cGFzc3dvcmQ=\n'

#curl http://localhost:3000/posts/1 -H 'Authorization: Token token=35ca43c2497a1c692f57197653b9f138'