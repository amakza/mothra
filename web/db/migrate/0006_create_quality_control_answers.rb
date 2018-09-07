class CreateQualityControlAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :quality_control_answers do |t|
      t.integer :project_id
      t.integer :quality_point_id
      t.integer :quality_control_id
      t.boolean :status
      t.text :comment

      t.timestamps
    end
  end
end

