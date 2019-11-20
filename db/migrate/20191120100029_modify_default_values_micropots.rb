class ModifyDefaultValuesMicropots < ActiveRecord::Migration[6.0]
  def change
    change_column :microposts, :status, :integer,  default: 0
    change_column :microposts, :votes, :integer, default: 0
  end
end
