# frozen_string_literal: true

class ConditionController < ApplicationController
  def show
    statute = Statute.find(params[:id])
    conditions = statute.conditions

    return render json: conditions[0] if conditions.length == 1

    render json: find_matching_condition(conditions, statute)
  end

  private

  def find_matching_condition(conditions, statute)
    conditions.find do |condition|
      statute.condition_fields.all? do |field|
        param_condition = params[field.input_name] || 'false'
        condition_value = condition[field.input_name] ? condition[field.input_name].to_s : 'false'

        condition_value == param_condition
      end
    end
  end
end


# next update the conditional inputs displayed in the conditionForm
