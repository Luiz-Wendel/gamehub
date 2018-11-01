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
    #puts %x(rake dev:generate_comments)

    puts "Gerando o ambiente de desenvolvimento...[OK]"
  end

  # Task
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

  # Task
  desc "Cria Membros fakes"
  task generate_members: :environment do
    puts "Cadastrando Membros..."

    100.times do
      member = Member.new(email: Faker::Internet.email, # Gera um email aleatório
                    password: "12345678",
                    password_confirmation: "12345678"
                    )
                    
      member.build_profile_member # Gera o perfil em branco
      
      # Preenche os campos do perfil
      member.profile_member.name = Faker::Name.name_with_middle # Gera um nome completo aleatório
      member.profile_member.username = Faker::Name.first_name # Gera um nome de usuário aleatório
      
      member.save! # Salva o membro, a esclamação serve para mostrar o erro gerado pelo Active Record
    end

    puts "Cadastrando Membros...[OK]"
  end

  # Task
#  desc "Cria Comentários fakes"
#  task generate_comments: :environment do
#    puts "Cadastrando Comentários..."
#    
#    Ad.all.each do |ad|
#      (Random.rand(3)).times do
#        Comment.create!(
#          body: Faker::Lorem.paragraph([1,2,3].sample), # Gera um corpo com 1 a 3 parágrafos
#          member: Member.all.sample, # Sorteia um membro aleatório
#          ad: ad # Seleciona o anúncio atual
#        )
#      end
#    end
    
#    puts "Cadastrando Comentários...[OK]"
#  end

end
