# frozen_string_literal: true

require "test_helper"

class SeedTest < ActiveSupport::TestCase
  test "create_or_increment created new records" do
    Seed.create_or_increment("test")

    assert_equal(1, Seed.find_by(word: "test").count)
  end

  test "create_or_increment increments count" do
    2.times { Seed.create_or_increment("test") }

    assert_equal(2, Seed.find_by(word: "test").count)
  end
  # test "the truth" do
  #   assert true
  # end
end
