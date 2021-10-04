# frozen_string_literal: true
class UserController < ActionController::API
  include Secured

  def profile
    @user = User.includes(:profile).find(1)
    render json: @user, 
      root: true,
      include: [ 
        profile: { 
          except: [ :id, :reference_type, :reference_id ] 
        }
      ],
      except: [ :id ]
  end
  
end