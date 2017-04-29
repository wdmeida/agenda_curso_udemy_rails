namespace :utils do
  desc "Popular banco de dados."
  task seed: :environment do
    
    puts "Gerando usuários (User)..."
    
    4.times  do |i|
      User.create!( email: Faker::Internet.email,
                               password: "123456",
                               password_confirmation: "123456" )
    end
    
    puts "Gerando usuários (User)...[OK]"
    
    puts "Gerando os contatos (Contacts)..."
      #! Força o commit para gravar de fato no banco.
      100.times do |i|
        #Utiliza a gem Faker para gerar os dados aleatórios.
        Contact.create!( name: Faker::Name.name,
                     email: Faker::Internet.email,
                     kind: Kind.all.sample,
                     user: User.all.sample, 
                     rmk: LeroleroGenerator.sentence([1,2,3,4,5].sample) 
        )
      end
    puts "Gerando os contatos (Contacts)...[OK]"
      
    puts "Gerando os endereços (Addresses)..."
      #Cadastra um endereço para cada contato.
      Contact.all.each do |contact|
        Address.create!(
          street: Faker::Address.street_address,
          city: Faker::Address.city,
          state: Faker::Address.state_abbr,
          contact: contact
        )
      end
    puts "Gerando os endereços (Addresses)...[OK]"
    
    puts "Gerando os telefones (Phones)..."
      Contact.all.each do |contact|
        #Sorteia a quantidade de telefones.
        Random.rand(1..5).times do |i| 
          Phone.create!(
            phone: Faker::PhoneNumber.phone_number,
            contact: contact
          )
        end
      end
    puts "Gerando os telefones (Phones)...[OK]"
    
    
    end

end
