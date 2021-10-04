class Player < ApplicationRecord

  belongs_to :user
  has_many :teammates
  has_many :teams, through: :teammates
  has_many :player_games
  has_many :games, through: :player_games

end