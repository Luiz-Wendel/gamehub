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
	Category.find_or_create_by(description: category) # Confere se não tem uma categoria cadastrada com o mesmo nome antes de adicionar um novo
end
puts "Cadastrando as CATEGORIAS...[OK]"

#######################################################

puts "Cadastrando os GÊNEROS..."
genres = ["Ação",
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

genres.each do |genre|
	Genre.find_or_create_by(description: genre) # Confere se não tem um gênero cadastrado com o mesmo nome antes de adicionar um novo
end
puts "Cadastrando os GÊNEROS...[OK]"

#######################################################

puts "Cadastrando as CLASSIFICAÇÕES..."
classifications = ["N/A",
									 "Livre",
									 "10+",
									 "12+",
									 "14+",
									 "16+",
									 "18+"]

classifications.each do |classification|
	Classification.find_or_create_by(rating_system: classification) # Confere se não tem uma classificação cadastrada com o mesmo nome antes de adicionar uma nova
end
puts "Cadastrando as CLASSIFICAÇÕES...[OK]"

#######################################################

puts "Cadastrando as PLATAFORMAS..."
platforms = ["Atari",
						 "Xbox",
						 "Xbox 360",
						 "Xbox One",
						 "Game Boy",
						 "Super Nintendo",
						 "Nintendo 64",
						 "Game Boy Advance",
						 "GameCube",
						 "DS",
						 "WII",
						 "WII U",
						 "3DS",
						 "Switch",
						 "Sega Genesis",
						 "PlayStation 1",
						 "PlayStation 2",
						 "PlayStation 3",
						 "PlayStation 4",
						 "PC"]

platforms.each do |platform|
	Platform.find_or_create_by(name: platform) # Confere se não tem uma plataforma cadastrada com o mesmo nome antes de adicionar uma nova
end
puts "Cadastrando as PLATAFORMAS...[OK]"

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
