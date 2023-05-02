class CreateConditionFields < ActiveRecord::Migration[7.0]
  def change
    create_table :condition_fields do |t|
      t.string :options, array: true, default: []
      t.string :input_name
      t.string :input_type
      t.string :text

      t.timestamps
    end
  end
end
