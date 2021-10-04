class Season < ApplicationRecord

  has_one :profile, as: :reference
  has_one :integration, as: :reference
  belongs_to :series
  has_many :season_cars
  has_many :cars, through: :season_cars
  has_many :season_tracks
  has_many :tracks, through: :season_tracks
  has_many :season_drivers
  has_many :drivers, through: :season_drivers
  has_many :sessions

end