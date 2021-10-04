class SeasonDriver < ApplicationRecord

  belongs_to :season
  belongs_to :team
  belongs_to :teammate
  belongs_to :car
  has_many :drivers
  has_many :sessions, through: :drivers

end