class BorrarParametresInutilsDeUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :name
    remove_column :users, :google_token
    remove_column :users, :google_refresh_token
  end
end
