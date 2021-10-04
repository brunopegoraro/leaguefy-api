class CarClass < ApplicationRecord

  has_one :profile, as: :reference
  has_one :integration, as: :reference
  has_many :cars

end