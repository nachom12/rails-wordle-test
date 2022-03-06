class AddWordReferenceToGame < ActiveRecord::Migration[5.2]
  def change
    remove_column :games, :word, :string
    add_reference :games, :word, foreign_key: true
  end
end
