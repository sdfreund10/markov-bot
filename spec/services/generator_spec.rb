require "rails_helper"

RSpec.describe Generator do
  before do
    @gen = Generator.new

    @gen.dictionary = { "test" => 5, "dictionary" => 3, "hash" => 2 }
  end
  describe "generator" do
    it "converts hash values to rolling sum" do
      expect(@gen.generator).to eq(
        "test" => 5, "dictionary" => 8, "hash" => 10
      )
    end
  end

  describe "generate_word" do
    it "generates words according to weights" do
      counts = Hash.new 0

      1_000.times do
        counts[@gen.generate_word] += 1
      end

      # binomially distributed -- should pass ~95% of the time
      expect(counts["test"]).to be_within(30).percent_of(500)
      expect(counts["hash"]).to be_within(25).percent_of(200)
    end
  end
end
