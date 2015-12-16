class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :encrypted_password, null: false
      t.string :username
      t.string :f_name
      t.string :l_name
      t.string :country
      t.string :city
      t.string :date_of_birth
      t.integer :gender

      t.timestamps
    end
    
    add_index :users, :email, unique: true
  end
end
