# frozen_string_literal: true

class StatuteController < ApplicationController
  def index
    statutes = Statute.select(:id, :name, :url)
    render json: statutes
  end
end
