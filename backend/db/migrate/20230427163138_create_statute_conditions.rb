class CreateStatuteConditions < ActiveRecord::Migration[7.0]
  def change
    create_table :statute_conditions do |t|
      t.string :dependent_url
      t.string :type
      t.string :text
      t.string :statute_id

      t.timestamps
    end
  end
end
