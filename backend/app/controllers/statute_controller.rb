# frozen_string_literal: true

class StatuteController < ApplicationController
  def index
    statutes = Statute.select(:id, :name, :url)
    render json: statutes
  end

  def show
    statute = Statute.includes(:condition_fields).find(params[:id])
    render json: statute.condition_fields.as_json(only: %i[input_name input_type text], methods: [:options])
  end
end
