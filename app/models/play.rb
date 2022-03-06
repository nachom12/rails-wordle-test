class Play < ApplicationRecord
  belongs_to :game
  enum letter_1_result {
    green: 0,
    yellow: 1,
    red: 2
  }
  enum letter_2_result {
    green: 0,
    yellow: 1,
    red: 2
  }
  enum letter_3_result {
    green: 0,
    yellow: 1,
    red: 2
  }
  enum letter_4_result {
    green: 0,
    yellow: 1,
    red: 2
  }
  enum letter_5_result {
    green: 0,
    yellow: 1,
    red: 2
  }
end
