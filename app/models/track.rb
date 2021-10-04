class Track < ApplicationRecord

  has_one :profile, as: :reference
  has_one :integration, as: :reference

end