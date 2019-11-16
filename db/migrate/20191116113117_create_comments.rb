class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :micropost_id
      t.text :body
      t.references :micropost, null: false, foreign_key: true

      t.timestamps
    end
    add_index :comments, :micropost_id
  end
end
