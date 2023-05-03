# frozen_string_literal: true

class CreateStatutes < ActiveRecord::Migration[7.0]
  def change
    create_table :statutes do |t|
      t.string :name
      t.string :url
      t.text :conditions

      t.timestamps
    end
  end
end
