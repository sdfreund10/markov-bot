# frozen_string_literal: true

class MarkovBotController < ApplicationController
  before_action :set_user
  def index; end

  def set_user
    cookies[:token] ||= SecureRandom.base64(10)
    @user = User.find_or_create_by(token: cookies[:token])
  end
end
