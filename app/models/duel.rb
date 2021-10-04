class Duel < ApplicationRecord

  belongs_to :session
  has_many :duelers
  has_many :driver, through: :duelers
  has_many :rounds

end