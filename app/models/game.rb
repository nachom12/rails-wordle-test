class Game < ApplicationRecord
  belongs_to :user
  enum status: { 
    playing: 0, 
    won: 1, 
    lost:2 
  }
end
