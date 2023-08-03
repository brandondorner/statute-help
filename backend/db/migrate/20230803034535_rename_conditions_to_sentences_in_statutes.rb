# frozen_string_literal: true

class RenameConditionsToSentencesInStatutes < ActiveRecord::Migration[7.0]
  def change
    rename_column :statutes, :conditions, :sentences
  end
end
