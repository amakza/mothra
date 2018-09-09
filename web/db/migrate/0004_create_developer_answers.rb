class CreateDeveloperAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :developer_answers do |t|
      t.integer :project_id
      t.integer :quality_point_id
      t.integer :section_id
      t.integer :developer_id
      t.boolean :status
      t.text :comment

      t.timestamps
    end
  end
end
