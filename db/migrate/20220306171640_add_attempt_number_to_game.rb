class AddAttemptNumberToGame < ActiveRecord::Migration[5.2]
  def change
    remove_column :plays, :attempt_number

    add_column :games, :attempt_number, :integer
  end
end
