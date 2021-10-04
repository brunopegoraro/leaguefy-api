class Series < ApplicationRecord

  has_one :profile, as: :reference
  has_one :integration, as: :reference
  belongs_to :league
  belongs_to :game
  has_many :seasons

end