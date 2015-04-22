class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.text :message
    	t.string :rating

    	t.integer :user_id
    	t.integer :cart_id
      t.timestamps
    end

    add_index :comments, [:user_id, :cart_id]
    add_index :comments, :cart_id
  end
end
