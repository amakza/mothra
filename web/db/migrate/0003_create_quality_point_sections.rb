class CreateQualityPointSections < ActiveRecord::Migration[5.2]
  def change
    create_table :quality_point_sections do |t|
      t.string :name

      t.timestamps
    end
  end
end
