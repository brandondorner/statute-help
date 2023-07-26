# frozen_string_literal: true

class AddTitleColumnToStatutes < ActiveRecord::Migration[7.0]
  def change
    add_column :statutes, :title, :string
  end
end
