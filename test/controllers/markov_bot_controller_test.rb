require 'test_helper'

class MarkovBotControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get markov_bot_index_url
    assert_response :success
  end

end
