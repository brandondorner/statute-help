class AddDependentColumnsToConditionFields < ActiveRecord::Migration[7.0]
  def change
    add_column :condition_fields, :dependent_on, :string
    add_column :condition_fields, :dependent_condition, :string
  end
end
