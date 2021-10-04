# frozen_string_literal: true
class GamesController < ActionController::API
  include Secured

  def index
    @games = Game.includes(:profile).all
    render json: @games, 
      root: true,
      include: [ 
        profile: { 
          except: [ :id, :reference_type, :reference_id ] 
        }
      ],
      except: [ :id ]
  end

  def new
    @game = Game.new
    render json: @games
  end
  
end