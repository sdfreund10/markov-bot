require "test_helper"

class SentenceProcessorControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get sentence_processor_new_url
    assert_response :success
  end

  test "should get create" do
    get sentence_processor_create_url
    assert_response :success
  end
end
