class CreateQualityPoints < ActiveRecord::Migration[5.2]
  def change
    create_table :quality_points do |t|
      t.integer :section_id
      t.string  :title
      t.text    :question
      t.boolean :is_shown
      t.text    :warnings

      t.timestamps
    end
  end
end
