# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



puts "Cadastrando as CATEGORIAS..."
categories = ["Ação",
							"Aventura",
							"Estratégia",
							"RPG",
							"Esporte",
							"Corrida",
							"Jogo on-line",
							"Simulação",
							"Tabuleiro",
							"Casual",
							"Cartas",
							"Ritmo",
							"Plataforma",
							"Quebra-Cabeça",
							"Trivia",
							"Luta",
							"Tiro",
							"Point and Click",
							"Hack and Slash",
							"Open World"]

categories.each do |category|
	Category.find_or_create_by(description: category) #Confere se não tem uma categoria cadastrada com o mesmo nome antes de adicionar um novo
end
puts "Cadastrando as CATEGORIAS...[OK]"

#######################################################

puts "Cadastrando o Administrador Padrão..."

	Admin.create!(name: "Master Admin",
								email: "admin@admin.com",
								password: "admin321",
								password_confirmation: "admin321",
								role: 0)

puts "Cadastrando o Administrador Padrão...[OK]"

#######################################################

puts "Cadastrando o Membro Padrão..."

	member = Member.new(email: "member@member.com",
								 password: "member321",
								 password_confirmation: "member321")
								 
	member.build_profile_member # Gera o perfil em branco
  
  # Preenche os campos do perfil
  member.profile_member.name = "Membro Padrão"
  member.profile_member.username = "Membroso"
  
  member.save! # Slava o membro, a esclamação serve para mostrar o erro gerado pelo Active Record

puts "Cadastrando o Membro Padrão...[OK]"
