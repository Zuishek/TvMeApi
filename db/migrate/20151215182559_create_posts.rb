class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :user, index: true
      t.string :show_name
      t.string :imdb_link
      t.text :text
      t.references :wall, index: true

      t.timestamps
    end
  end
end
