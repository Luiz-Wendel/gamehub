# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

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
					"Open World",
					"Single player",
					"Multiplayer"]

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
						 "Xbox One",
						 "Xbox 360",
						 "Game Boy",
						 "Super Nintendo",
						 "Nintendo 64",
						 "Game Boy Advance",
						 "GameCube",
						 "DS",
						 "3DS",
						 "WII",
						 "WII U",
						 "Switch",
						 "Saga Genesis",
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
  
  member.save! # Salva o membro, a exclamação serve para mostrar o erro gerado pelo Active Record

puts "Cadastrando o Membro Padrão...[OK]"

#######################################################

puts "Cadastrando os Jogos..."

	Game.create!([{:name => "Crysis",
											 :description => "Tanto em gráficos realistas, quanto em jogabilidade e efeitos físicos impressionantes, a inovação pode ser vista nas diversas demonstrações exibidas pelos desenvolvedores durante os últimos meses.
			A história, apesar de não ser o ponto forte do jogo, não fica devendo em nada quando comparada com a de outros títulos similares, pois ela é simples: em 2020, arqueólogos americanos em uma ilha da Coreia do Norte acham algo interessante em suas escavações. Porém, o governo norte-coreano envia soldados imediatamente para o local e você, um soldado exemplar da Força Delta do exército dos Estados Unidos da América, é enviado para investigar o local.
			Vale ressaltar alguns pontos interessantes, tais como: as armas são preparadas para serem modificadas de acordo com a necessidade do jogador, outras são capazes de destruir construções com apenas um disparo; a vestimenta utilizada pelo personagem, uma armadura com tecnologia de nano robôs, capaz de aumentar a força, velocidade, resistência de forma sobre-humana, e até tornar o personagem invisível; o ambiente de jogo é altamente destrutível, sendo possível danificar até mesmo a vegetação; e principalmente os inimigos, alienígenas terríveis e poderosos, e soldados treinados para suportar qualquer situação. Pode-se também conduzir veículos e disparar seus armamentos ao mesmo tempo, mesmo estando sozinho nos mesmos.",
											 :genres => [Genre.find(7), Genre.find(17), Genre.find(21), Genre.find(22)],
											 :classification => Classification.find(6),
											 :platforms => [Platform.find(4), Platform.find(18), Platform.find(20)],
											 :picture => File.new(Rails.root.join('public', 'templates', 'images-for-games', "Crysis-box-art.jpg"), 'r')
											},
											{:name => "Crysis 2",
											 :description => "Há 3 anos, militares vestidos com uma Nanosuit de última geração impediram o que parecia ser o início de uma invasão alienígena. Mas, recentemente, nos Estados Unidos, desastres naturais começaram a acontecer como pragas. E há poucos dias, um vírus de força destrutiva está corroendo as pessoas da ilha de Manhattan, em New York.
			Os militares enviados para lá estão sendo incrivelmente violentos. E eles não estão sabendo lidar com o pior: a verdadeira invasão alienígena, que não vem somente do espaço, mas também de dentro do próprio planeta Terra. 
			O único capaz de impedir tudo isso é Prophet, que sofre os efeitos do vírus e é obrigado a passar sua Nanosuit para um fuzileiro da marinha que se encontrava quase morto, após isso ele se mata para evitar a contaminação total de seu corpo pelo vírus. Armado com a última Nanosuit existente, Alcatraz irá enfrentar militares corruptos e alienígenas poderosíssimos para defender o que sobrou de New York.",
											 :genres => [Genre.find(7), Genre.find(17), Genre.find(21), Genre.find(22)],
											 :classification => Classification.find(6),
											 :platforms => [Platform.find(4), Platform.find(18), Platform.find(20)],
											 :picture => File.new(Rails.root.join('public', 'templates', 'images-for-games', "Crysis_2_cover.png"), 'r')
											},
											{:name => "Crysis 3",
											 :description => "Os jogadores irão assumir o papel de Laurence Barnes (chamado de Profeta, que 'tomou' o corpo de Alcatraz), que regressa a Nova Iorque para descobrir que a cidade foi enclausurada numa Nanodome criada pela corrupta Cell Corporation. A Liberty Dome de Nova Iorque é uma floresta tropical cheia de árvores, pântanos densos e rios de correntes fortes. Dentro da Liberty Dome, sete ambientes distintos e traiçoeiros são conhecidos como 'as Sete Maravilhas'. Neste mundo perigoso que exige armamento e tácticas avançadas, Prophet vai recorrer a um arco letal, sua armadura avançada e tecnologia alienígena devastadora para se tornar o caçador mais mortífero do planeta.",
											 :genres => [Genre.find(7), Genre.find(17), Genre.find(21), Genre.find(22)],
											 :classification => Classification.find(6),
											 :platforms => [Platform.find(4), Platform.find(18), Platform.find(20)],
											 :picture => File.new(Rails.root.join('public', 'templates', 'images-for-games', "Crysis_3_logo.jpg"), 'r')
											},
											{:name => "Crash Bandicoot",
											 :description => "Crash Bandicoot é uma série de jogos criada por Andy Gavin e Jason Rubin que são inclusive os fundadores da Naughty Dog. A série consiste basicamente nas aventuras do bandicoot geneticamente alterado Crash, que luta para impedir o planos do cientista do mal Neo Córtex e seus lacaios. A história do jogo se passa nas fictícias Ilhas Wumpa, um arquipélago situado na costa noroeste da Austrália, mas outros lugares são revelados.",
											 :genres => [Genre.find(1), Genre.find(2), Genre.find(13)],
											 :classification => Classification.find(2),
											 :platforms => [Platform.find(2), Platform.find(3), Platform.find(4), Platform.find(8), Platform.find(9), Platform.find(10), Platform.find(12), Platform.find(14), Platform.find(16), Platform.find(17), Platform.find(18), Platform.find(19), Platform.find(20)],
											 :picture => File.new(Rails.root.join('public', 'templates', 'images-for-games', "crash-bandicoot.jpg"), 'r')
											},
											{:name => "Mario Kart 8",
											 :description => "Super Mario Kart é um jogo de corrida com personagens da série Mario.",
											 :genres => [Genre.find(6), Genre.find(21), Genre.find(22)],
											 :classification => Classification.find(2),
											 :platforms => [Platform.find(13), Platform.find(14)],
											 :picture => File.new(Rails.root.join('public', 'templates', 'images-for-games', "MarioKart8.jpg"), 'r')
											},
											{:name => "Rayman Legends",
											 :description => "Rayman, Globox e os Teensies estão vagando por uma floresta encantada quando descobrem uma tenda misteriosa repleta com uma série de pinturas cativantes. Quando olham mais de perto, percebem que cada pintura conta a história de um mundo mítico. Enquanto se concentram em uma pintura que mostra uma terra medieval, de repente são sugados para dentro do mundo. Aí começa a aventura. O grupo deve correr, pular e lutar ao longo de cada um dos mundos para salvar a pátria e descobrir os segredos de todas as pinturas lendárias.",
											 :genres => [Genre.find(1), Genre.find(2), Genre.find(13)],
											 :classification => Classification.find(2),
											 :platforms => [Platform.find(3), Platform.find(4), Platform.find(12), Platform.find(13), Platform.find(14), Platform.find(18), Platform.find(19), Platform.find(20)],
											 :picture => File.new(Rails.root.join('public', 'templates', 'images-for-games', "rayman-legends.jpg"), 'r')
											}
										])

puts "Cadastrando os Jogos...[OK]"

#######################################################
