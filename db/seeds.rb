# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#require 'faker'


Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each { |seed| load seed }
# La finalidad de la línea de código anterior es ejecutar el código 
# que está en cada uno de los archivos almacenados dentro del directorio seeds

categories = [ 'Smartphones', 'Shoes', 'Accesories']
categories.each do |categ|
    Category.create(name: categ, public: Faker::Boolean.boolean)
end


