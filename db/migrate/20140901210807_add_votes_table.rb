class AddVotesTable < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :vote
      t.integer :user_id
      t.string :voteable_type
      t.string :voteable_id
      # alternative to above 2 lines is
      # t.references :voteable, polymorphic: true

      t.timestamps

    end
  end
end
