namespace :utils do

  desc "Cria Administradores fakes"
  task generate_admins: :environment do
    puts "Cadastrando Administradores..."

    10.times do
      Admin.create!(name: Faker::Name.name, # Gera um nome aleatório
                    email: Faker::Internet.email, # Gera um email aleatório
                    password: "12345678",
                    password_confirmation: "12345678",
                    role: [0,1,1,1].sample) # Escolhe um número entre o e 1, com maiores chances de ser 1
    end

    puts "Cadastrando Administradores...[OK]"
  end

  desc "Cria Anúncios fakes"
  task generate_ads: :environment do
    puts "Cadastrando Anúncios..."

    100.times do
      Ad.create!(
        title: Faker::Lorem.sentence([2,3,4].sample), # Gera um título com 2 a 5 sentenças
        description: LeroleroGenerator.paragraph(Random.rand(3)), # Gera uma descrição com 1 a 3 parágrafos
        member: Member.all.sample, # Sorteia um membro aleatório
        category: Category.all.sample) # Sorteia uma categoria aleatória
    end

    puts "Cadastrando Anúncios...[OK]"
  end

end
