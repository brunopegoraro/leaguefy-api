# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(email: 'admin@ers.com')

game = Game.create
profile = Profile.create(reference: game, first_name: 'iRacing')
integration = Integration.create(reference: game, game: game, game_ref_id: 'iRacing')

player = Player.create(user: user, favorite_number: '78', games: [game])
profile = Profile.create(reference: player, first_name: 'Bruno', last_name: 'Pegoraro')

car_class = CarClass.create
profile = Profile.create(reference: car_class, first_name: 'GT3')
integration = Integration.create(reference: car_class, game: game, game_ref_id: 'iRacingCarClassGT3')

car = Car.create(car_class: car_class)
profile = Profile.create(reference: car, first_name: 'Ferrari 488 GT3')
integration = Integration.create(reference: car, game: game, game_ref_id: 'iRacingCarFerrariGT3')

track = Track.create
profile = Profile.create(reference: track, first_name: 'Interlagos')
integration = Integration.create(reference: track, game: game, game_ref_id: 'iRacingTrackInterlagos')

team = Team.create
profile = Profile.create(reference: team, first_name: 'HUB Racing')
integration = Integration.create(reference: team, game: game, game_ref_id: 'iRacingTeamHUBRacing')

teammate = Teammate.create(player: player, team: team, number: '78')

league = League.create
profile = Profile.create(reference: league, first_name: 'Leaguefy')
integration = Integration.create(reference: league, game: game, game_ref_id: 'iRacingLeagueLeaguefy')

series = Series.create(league: league, game: game)