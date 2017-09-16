# frozen_string_literal: true

class SentenceGeneratorsController < ApplicationController
  def create
    render json: { sentence: SentenceGenerator.new.sentence }
  end
end