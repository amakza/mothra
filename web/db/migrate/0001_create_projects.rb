class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string  :title
      t.integer :service_id
      t.string  :code
      t.string  :owner
      t.integer :developer_status
      t.integer :manager_status
      t.integer :quality_control_status
      t.string  :url

      t.timestamps
    end

    add_index :projects, :id
    add_index :projects, :service_id
    add_index :projects, :developer_status
    add_index :projects, :manager_status
    add_index :projects, :quality_control_status
  end
end
