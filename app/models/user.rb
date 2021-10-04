class User < ApplicationRecord

  has_one :profile, as: :reference
  
end
