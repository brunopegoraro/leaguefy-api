class CreateTables < ActiveRecord::Migration[6.1]
  
  def change

    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      t.string   :unlock_token # Only if unlock strategy is :email or :both
      t.datetime :locked_at

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token,   unique: true
    add_index :users, :unlock_token,         unique: true
    
    create_table :profiles do |t|
      t.references :reference, polymorphic: true
      t.string :first_name
      t.string :last_name
      t.string :nick_name
      t.text :description
      t.string :country
      t.string :state
      t.string :city
      t.date :birthday

      t.timestamps
    end
    add_index :profiles, [:reference_type, :reference_id]

    create_table :games do |t|

      t.timestamps
    end

    create_table :integrations do |t|
      t.references :reference, polymorphic: true
      t.belongs_to :game
      t.string :game_ref_id   

      t.timestamps
    end
    add_index :integrations, [:reference_type, :reference_id]

    create_table :players do |t|
      t.belongs_to :user
      t.string :favorite_number

      t.timestamps
    end

    create_table :player_games do |t|
      t.belongs_to :player
      t.belongs_to :game
      t.string :player_game_id
      t.integer :total_score

      t.timestamps
    end

    create_table :car_classes do |t|

      t.timestamps
    end

    create_table :cars do |t|
      t.belongs_to :car_class

      t.timestamps
    end

    create_table :tracks do |t|
      t.float :length

      t.timestamps
    end

    create_table :teams do |t|

      t.timestamps
    end

    create_table :teammates do |t|
      t.belongs_to :player
      t.belongs_to :team
      t.string :number
      t.integer :role

      t.timestamps
    end

    create_table :leagues do |t|

      t.timestamps
    end

    create_table :series do |t|
      t.belongs_to :league
      t.belongs_to :game

      t.timestamps
    end

    create_table :seasons do |t|
      t.belongs_to :series

      t.timestamps
    end

    create_table :season_cars do |t|
      t.belongs_to :season
      t.belongs_to :car

      t.timestamps
    end

    create_table :season_tracks do |t|
      t.belongs_to :season
      t.belongs_to :track

      t.timestamps
    end

    create_table :season_drivers do |t|
      t.belongs_to :season
      t.belongs_to :team
      t.belongs_to :teammate
      t.belongs_to :car
      t.string :number
      t.integer :initial_rating
      t.integer :current_rating

      t.timestamps
    end

    create_table :sessions do |t|
      t.belongs_to :season
      t.belongs_to :track
      t.integer :session_type # 1: Practice, 2: Qualifying, 3: Warmup, 4: Race
      t.datetime :start_at
      t.integer :duration_minutes

      t.timestamps
    end

    create_table :drivers do |t|
      t.belongs_to :session
      t.belongs_to :season_driver
      t.belongs_to :best_lap, foreign_key: { to_table: 'laps' }
      t.belongs_to :top_speed_lap, foreign_key: { to_table: 'laps' }
      t.integer :total_laps
      t.float :best_lap
      t.float :top_speed
      t.integer :incidents
      t.integer :start_position
      t.integer :finish_position
      t.integer :initial_score
      t.integer :score_variation

      t.timestamps
    end

    create_table :laps do |t|
      t.belongs_to :driver
      t.integer :lap
      t.integer :position
      t.float :lap_time
      t.float :sector_1
      t.float :sector_2
      t.float :sector_3
      t.float :top_speed
      t.integer :incidents
      t.string :comments

      t.timestamps
    end

    create_table :scores do |t|
      t.belongs_to :driver
      t.string :score_name
      t.float :score_value
      t.text :score_description

      t.timestamps
    end 

    create_table :duels do |t|
      t.belongs_to :session
      t.datetime :start_at
      t.integer :laps
      t.integer :start_seconds_interval

      t.timestamps
    end

    create_table :duelers do |t|
      t.belongs_to :duel
      t.belongs_to :driver
      t.integer :position 
      t.float :start_delta

      t.timestamps
    end

    create_table :rounds do |t|
      t.belongs_to :duel
      t.belongs_to :lap

      t.timestamps
    end 
    
  end
end
