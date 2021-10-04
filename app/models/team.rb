class Team < ApplicationRecord

  has_one :profile, as: :reference
  has_many :teammates
  has_many :season_drivers
  has_many :seasons, through: :season_drivers

end