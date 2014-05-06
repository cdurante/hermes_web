class AddPhysicianToUsers < ActiveRecord::Migration
  def change
    add_column :users, :physician, :boolean, default: false
  end
end
