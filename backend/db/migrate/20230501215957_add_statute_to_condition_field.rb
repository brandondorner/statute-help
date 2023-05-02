class AddStatuteToConditionField < ActiveRecord::Migration[7.0]
  def change
    add_reference :condition_fields, :statute, null: false, foreign_key: true
  end
end
