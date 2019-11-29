class ModifyFieldsMicroposts < ActiveRecord::Migration[6.0]
  def change
    remove_column :microposts, :content, :text
    add_column :microposts, :description, :string    
    add_column :microposts, :kind, :integer
    add_column :microposts, :priority, :integer
    add_column :microposts, :status, :integer
    add_column :microposts, :votes, :integer
    add_column :microposts, :created, :datetime
    add_column :microposts, :updated, :datetime
  end
end
