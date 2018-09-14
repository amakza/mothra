class CreateQualityControlAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :quality_control_answers do |t|
      t.integer :project_id
      t.integer :quality_point_id
      t.integer :section_id
      t.integer :quality_control_id
      t.string  :quality_control_name
      t.integer :status
      t.text :comment

      t.timestamps
    end

    add_index :quality_control_answers, :id
    add_index :quality_control_answers, :project_id
    add_index :quality_control_answers, :section_id
    add_index :quality_control_answers, :quality_control_id
    add_index :quality_control_answers, :status
  end
end

