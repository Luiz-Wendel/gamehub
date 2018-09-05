namespace :dev do

  desc "Gerar ambiente de desenvolvimento"
  task setup: :environment do
    images_path = Rails.root.join('public', 'system')

    puts "Gerando o ambiente de desenvolvimento..."

    puts "Apagando o banco de dados... #{%x(rake db:drop)}"
    puts "Apagando imagens de public/system... #{%x(rm -rf #{images_path})}"
    puts "Criando o banco de dados... #{%x(rake db:create)}"
    puts %x(rake db:migrate)
    puts %x(rake db:seed)
    puts %x(rake dev:generate_admins)
    puts %x(rake dev:generate_members)
    puts %x(rake dev:generate_ads)

    puts "Gerando o ambiente de desenvolvimento...[OK]"
  end

  desc "Cria Administradores fakes"
  task generate_admins: :environment do
    puts "Cadastrando Administradores..."

    10.times do
      Admin.create!(name: Faker::Name.name, # Gera um nome aleatório
                    email: Faker::Internet.email, # Gera um email aleatório
                    password: "12345678",
                    password_confirmation: "12345678",
                    role: [0,1,1,1].sample # Escolhe um número entre o e 1, com maiores chances de ser 1
                    )
    end

    puts "Cadastrando Administradores...[OK]"
  end

  desc "Cria Membros fakes"
  task generate_members: :environment do
    puts "Cadastrando Membros..."

    100.times do
      Member.create!(email: Faker::Internet.email, # Gera um email aleatório
                    password: "12345678",
                    password_confirmation: "12345678"
                    )
    end

    puts "Cadastrando Membros...[OK]"
  end

  desc "Cria Anúncios fakes"
  task generate_ads: :environment do
    puts "Cadastrando Anúncios..."
    
    # Membro padrão
    5.times do
      Ad.create!(
        title: Faker::Lorem.sentence([2,3,4].sample),
        description: LeroleroGenerator.paragraph(Random.rand(3)),
        member: Member.first,
        category: Category.all.sample,
        price: "#{Random.rand(9999)},#{Random.rand(99)}",
        picture: File.new(Rails.root.join('public', 'templates', 'images-for-ads', "#{Random.rand(9)}.jpg"), 'r')
        )
    end

    # Outros membros
    100.times do
      Ad.create!(
        title: Faker::Lorem.sentence([2,3,4].sample), # Gera um título com 2 a 5 sentenças
        description: LeroleroGenerator.paragraph(Random.rand(3)), # Gera uma descrição com 1 a 3 parágrafos
        member: Member.all.sample, # Sorteia um membro aleatório
        category: Category.all.sample, # Sorteia uma categoria aleatória
        price: "#{Random.rand(9999)},#{Random.rand(99)}", # Gera um valor aleatório entra 0,0 e 9999,99
        picture: File.new(Rails.root.join('public', 'templates', 'images-for-ads', "#{Random.rand(9)}.jpg"), 'r') # Gera um caminho de uma imagem
        )
    end

    puts "Cadastrando Anúncios...[OK]"
  end

end