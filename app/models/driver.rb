class Driver < ApplicationRecord

  belongs_to :session
  belongs_to :season_driver
  has_many :laps
  has_many :scores
  has_many :duelers
  has_many :duels, through: :duelers

end