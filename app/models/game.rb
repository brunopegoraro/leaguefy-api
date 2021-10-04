class Game < ApplicationRecord

  has_one :profile, as: :reference

end