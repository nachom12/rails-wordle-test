class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :word
      t.integer :status
      t.references :user, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
