class RemoveLetterColumnsFromPlay < ActiveRecord::Migration[5.2]
  def change
    remove_column :plays, :letter_1_result
    remove_column :plays, :letter_2_result
    remove_column :plays, :letter_3_result
    remove_column :plays, :letter_4_result
    remove_column :plays, :letter_5_result
    remove_column :plays, :letter_1_value
    remove_column :plays, :letter_2_value
    remove_column :plays, :letter_3_value
    remove_column :plays, :letter_4_value
    remove_column :plays, :letter_5_value

    add_column :plays, :attempted_word, :string
  end
end
