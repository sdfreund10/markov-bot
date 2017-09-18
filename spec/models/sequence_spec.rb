require 'rails_helper'

RSpec.describe Sequence, type: :model do
  describe "#create_or_increment" do
    it "creates new seeds" do
      expect{
        Sequence.create_or_increment("test", "phrase")
      }.to change{ Sequence.count }.by 1
      expect(
        Sequence.find_by(current_word: "test", next_word: "phrase").count
      ).to eq 1
    end

    it "increments count of existing seeds" do
      Sequence.create!(current_word: "test", next_word: "phrase", count: 1)
      expect{
        Sequence.create_or_increment("test", "phrase")
      }.to change{ Sequence.count }.by 0
      expect(
        Sequence.find_by(current_word: "test", next_word: "phrase").count
      ).to eq 2
    end
  end
end
