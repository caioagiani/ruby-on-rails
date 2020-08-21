namespace :dev do
  desc "Configura o amb dev"
  task setup: :environment do
    puts "Cadastrando os contatos..."
    
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name, 
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago)
      )
    end

    puts "Contatos cadastrados com sucesso."
  end
end
