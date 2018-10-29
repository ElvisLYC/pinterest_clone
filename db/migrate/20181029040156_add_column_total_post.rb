class AddColumnTotalPost < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :total_post, :integer
  end
end
