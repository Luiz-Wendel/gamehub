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

end
