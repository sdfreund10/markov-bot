require 'rails_helper'

RSpec.describe Seed, type: :model do
  describe "#create_or_increment" do
    it "creates new seeds" do
      expect{ Seed.create_or_increment("test") }.to change{ Seed.count }.by 1
      expect(Seed.find_by(word: "test").count).to eq 1
    end

    it "increments count of existing seeds" do
      Seed.create(word: "test", count: 1)
      expect{ Seed.create_or_increment("test") }.to change{ Seed.count }.by 0
      expect(Seed.find_by(word: "test").count).to eq 2
    end
  end
end
