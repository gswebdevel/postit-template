class ChangeStringToInt < ActiveRecord::Migration
  def change
    remove_column :votes, :voteable_id
    add_column :votes, :voteable_id, :integer
  end
end
