# frozen_string_literal: true

class ChangeConditionsToArray < ActiveRecord::Migration[7.0]
  def up
    remove_column :statutes, :conditions
    add_column :statutes, :conditions, :json, default: []
  end

  def down
    remove_column :statutes, :conditions
    add_column :statutes, :conditions, :json, default: [], array: true
  end
end
