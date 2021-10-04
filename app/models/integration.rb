class Integration < ApplicationRecord

  belongs_to :reference, polymorphic: true
  belongs_to :game

end