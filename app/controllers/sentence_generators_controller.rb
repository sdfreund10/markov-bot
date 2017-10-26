# frozen_string_literal: true

class SentenceGeneratorsController < ApplicationController
  before_action :find_user
  def create
    render json: { sentence: SentenceGenerator.new(@user).sentence }
  end

  def find_user
    @user = User.find_by(token: params[:user])
  end
end
