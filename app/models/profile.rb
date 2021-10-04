class Profile < ApplicationRecord

  belongs_to :reference, polymorphic: true

  #validates :reference, presence: true
  #validates :first_name, presence: true

end
