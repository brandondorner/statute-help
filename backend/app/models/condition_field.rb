# frozen_string_literal: true

class ConditionField < ApplicationRecord
  belongs_to :statute

  serialize :options, Array
end
