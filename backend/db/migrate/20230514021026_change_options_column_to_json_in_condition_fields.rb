# frozen_string_literal: true

class ChangeOptionsColumnToJsonInConditionFields < ActiveRecord::Migration[7.0]
  def up
    remove_column :condition_fields, :options
    add_column :condition_fields, :options, :text
  end

  def down
    remove_column :condition_fields, :options
    add_column :condition_fields, :options, :string, array: true
  end
end
