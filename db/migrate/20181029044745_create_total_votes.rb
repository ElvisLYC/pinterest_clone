class CreateTotalVotes < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :total_votes, :integer
  end
end
