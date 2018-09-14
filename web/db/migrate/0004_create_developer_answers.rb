class CreateDeveloperAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :developer_answers do |t|
      t.integer :project_id
      t.integer :quality_point_id
      t.integer :section_id
      t.integer :developer_id
      t.string  :developer_name
      t.integer :status
      t.text :comment

      t.timestamps
    end

    add_index :developer_answers, :id
    add_index :developer_answers, :project_id
    add_index :developer_answers, :section_id
    add_index :developer_answers, :developer_id
    add_index :developer_answers, :status
  end
end
