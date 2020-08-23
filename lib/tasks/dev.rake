namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    puts "Cadastrando os tipos de contatos..."
    
    kinds = %w(Amigo Comercial Conhecido)

    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end

    puts "Tipos de contatos cadastrados com sucesso."

    ## ==============

    puts "Cadastrando os contatos..."
    
    10.times do |i|
      Contact.create!(
        name: Faker::Name.name, 
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago),
        kind: Kind.all.sample
      )
    end

    puts "Contatos cadastrados com sucesso."

    ## =================

    puts "Cadastrando os telefones..."

    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        phone = Phone.create!(number:Faker::PhoneNumber.cell_phone)
        contact.phones << phone
        contact.save!
      end
    end

    puts "Telefones cadastrados com sucesso!"

    ## =================

    puts "Cadastrando os enderecos..."

    Contact.all.each do |contact|
     Address.create!(
       street: Faker::Address.street_address,
       city: Faker::Address.city,
       contact: contact
     )
    end

    puts "Enderecos cadastrados com sucesso!"
  end
end
