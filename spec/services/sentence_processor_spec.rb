# frozen_string_literal: true

require "rails_helper"

RSpec.describe SentenceProcessor do
  before do
    @test_sentence = <<~SAMPLE
      Have this test phrase. It is a neat sentence.
    SAMPLE

    @proc = SentenceProcessor.new @test_sentence
  end

  describe "#seeds" do
    it "generates an array of the first words in the sentences" do
      expect(@proc.seeds).to match_array %w(Have It)
    end
  end

  describe "add_seeds" do
    it "creates new seeds" do
      expect { @proc.add_seeds }.to change { Seed.count }.by 2
    end

    it "adds new seeds" do
      @proc.add_seeds
      processor = SentenceProcessor.new("Have another sentence!")

      expect { processor.add_seeds }.to change { Seed.count }.by 0

      expect(Seed.find_by(word: "Have").count).to eq 2
    end
  end

  describe "create_sequences" do
    it "creates sequences" do
      # 10 uniq words/puntuation
      expect { @proc.create_sequences }.to change { Sequence.count }.by 10

      expect(Sequence.pluck(:current_word)).to match_array(
        @test_sentence.downcase.tr(".", "").split(" ") + ["."]
      )
    end
  end

  describe "split_string" do
    it "splits string by words and punctuation" do
      # 9 words + 2 periods
      expect(@proc.split_string.count).to eq 11
      expect(@proc.split_string).to match_array(
        @test_sentence.downcase.tr(".", "").split(" ") + [".", "."]
      )
    end
  end
end
