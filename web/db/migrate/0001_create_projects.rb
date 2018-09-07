class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string  :title
      t.integer :service_id
      t.string  :code
      t.string  :owner
      t.integer :status
      t.string  :url

      t.timestamps
    end
  end
end
