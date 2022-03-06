class CreatePlays < ActiveRecord::Migration[5.2]
  def change
    create_table :plays do |t|
      t.references :game, foreign_key: true
      t.integer :attempt_number
      t.string :letter_1_value
      t.integer :letter_1_result
      t.string :letter_2_value
      t.integer :letter_2_result
      t.string :letter_3_value
      t.integer :letter_3_result
      t.string :letter_4_value
      t.integer :letter_4_result
      t.string :letter_5_value
      t.integer :letter_5_result

      t.timestamps
    end
  end
end
