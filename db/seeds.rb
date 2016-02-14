# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name:  "André Felipe Silveira",
             email: "andrefelipesilveira@gmail.com",
             password:              "123456",
             password_confirmation: "123456",
             admin: true)
Tag.create!(name: 'Acidente')

Tag.create!(name: 'Notícia')

Tag.create!(name: 'Caçador')

20.times do
  name  = Faker::Name.name
  email = Faker::Internet.email
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               admin: false)

  title = Faker::Name.title
  content = Faker::Lorem.paragraph(10)
  News.create!(title: title,
              content: content,
              tag_ids:  [1,2])
end

  Video.create!(title: 'Caçadorense cria sistema que usa água como combustível',
                link: 'https://www.youtube.com/watch?v=bOg-cBnCAvQ',
                tag_ids: 1)

  Video.create!(title: 'Motorista passa mal e bate trator em poste, em Caçador',
                link: 'https://www.youtube.com/watch?v=VC3F4bl7n_4',
                tag_ids: [1,3])

  Video.create!(title: 'Profissionais do Bem - Entrevista com o Neurocirurgião Dr. Stefan Szylewicz',
                link: 'https://www.youtube.com/watch?v=2yAbmiJkScs',
                tag_ids: [1,2,3])
