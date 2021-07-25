# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


#Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each { |seed| load seed }
# La finalidad de la línea de código anterior es ejecutar el código 
# que está en cada uno de los archivos almacenados dentro del directorio seeds

Marker.destroy_all
Type.destroy_all
Category.destroy_all


public = [true, false]

20.times do
    Category.create(
        name: Faker::Company.name,
        public: public.sample()
    )
end

# 10.times do Category.find(rand(1..11)).update(category_id: rand(12..20))
# end


20.times do
    Marker.create(
        name: Faker::Company.name,
        url: Faker::Internet.url
    )
end

20.times do
    Type.create(
        name: Faker::Company.name
    )
end