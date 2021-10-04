class Car < ApplicationRecord

  has_one :profile, as: :reference
  has_one :integration, as: :reference
  belongs_to :car_class

end