class SentenceProcessorController < ApplicationController
  def new
  end

  def create
    processor = SentenceProcessor.new(params["text"])

    processor.add_seeds
    processor.create_sequences
  end
end
