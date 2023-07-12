# frozen_string_literal: true

class StatuteController < ApplicationController
  def index
    statutes = Statute.select(:id, :name, :title, :url)
    render json: statutes
  end

  def show
    statute = Statute.includes(:condition_fields).find_by name: params[:name]
    render json: statute.condition_fields.as_json(
      only: %i[dependent_condition dependent_on input_name input_type text], methods: [:options]
    )
  end
end
