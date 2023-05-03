# frozen_string_literal: true

class Statute < ApplicationRecord
  has_many :condition_fields, dependent: :destroy
end
