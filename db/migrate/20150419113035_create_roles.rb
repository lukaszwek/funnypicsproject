class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.integer :role_type

      t.timestamps null: false
    end
  end
end
