class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
    t.string :template_name
    t.integer :user_id
    t.date :due_date
    t.string :location_url

    t.timestamps
    end
    add_index :forms, [:user_id, :created_at]
  end
end
