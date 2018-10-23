
class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.timestamps null: false
      t.string :email, null: false
      t.string :name
      t.string :avatar
      t.integer :role, default: 0
      t.string :password
      t.string :password_digest
    end
  end
end
