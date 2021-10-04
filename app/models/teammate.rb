class Teammate < ApplicationRecord

  belongs_to :team
  belongs_to :player
  has_many :season_drivers
  has_many :seasons, through: :season_drivers

end