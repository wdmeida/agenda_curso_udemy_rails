# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Cria usuário de teste padrão (User)..."
  User.create!( email: "admin@admin.com",
                password: "123456",
                password_confirmation: "123456" )

puts "Cria usuário de teste padrão (User)...[OK]"

puts "Gerando os tipos de contato (Kinds)..."
  #! Força o commit para gravar de fato no banco.
  Kind.create!([ { description: "Amigos" },
                 { description: "Contato" },
                 { description: "Comercial" } ])
puts "Gerando os tipos de contato (Kinds)...[OK]"