# frozen_string_literal: true

class StatuteController < ApplicationController
  def index
    statutes = Statute.all
    render json: statutes
  end
end
