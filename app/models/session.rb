class Session < ApplicationRecord

  has_one :profile, as: :reference
  has_one :integration, as: :reference
  belongs_to :season
  belongs_to :track
  has_many :drivers
  has_many :duels

end