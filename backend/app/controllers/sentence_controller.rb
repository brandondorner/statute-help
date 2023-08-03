# frozen_string_literal: true

class SentenceController < ApplicationController
  def show
    statute = Statute.find_by name: params[:name]
    sentences = statute.sentences

    return render json: sentences[0] if sentences.length == 1

    render json: find_matching_sentence(sentences, statute)
  end

  private

  def find_matching_sentence(sentences, statute)
    sentences.find do |sentence|
      statute.condition_fields.all? do |field|
        param_sentence = params[field.input_name] || 'false'
        sentence_value = sentence[field.input_name] ? sentence[field.input_name].to_s : 'false'

        sentence_value == param_sentence
      end
    end
  end
end
