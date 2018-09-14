class CreateManagerAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :manager_answers do |t|
      t.integer :project_id
      t.integer :quality_point_id
      t.integer :section_id
      t.integer :manager_id
      t.string  :manager_name
      t.integer :status
      t.text :comment

      t.timestamps
    end

    add_index :manager_answers, :id
    add_index :manager_answers, :project_id
    add_index :manager_answers, :section_id
    add_index :manager_answers, :manager_id
    add_index :manager_answers, :status
  end
end
