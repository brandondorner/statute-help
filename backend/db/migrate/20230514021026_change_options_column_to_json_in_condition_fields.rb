# frozen_string_literal: true

class ChangeOptionsColumnToJsonInConditionFields < ActiveRecord::Migration[7.0]
  def up
    remove_column :condition_fields, :options
    add_column :condition_fields, :options, :json, default: []
  end

  def down
    remove_column :condition_fields, :options
    add_column :condition_fields, :options, :string, default: [], array: true
  end
end
