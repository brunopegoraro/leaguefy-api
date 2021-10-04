class Dueler < ApplicationRecord

  belongs_to :duel
  has_many :driver

end