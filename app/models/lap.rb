class Lap < ApplicationRecord

  has_one :integration, as: :reference
  belongs_to :driver
  has_many :turns

end