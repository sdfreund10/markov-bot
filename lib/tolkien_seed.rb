# frozen_string_literal: true

class TolkienSeed
  def initialize(file)
    @file = File.open(file)
    @user = User.find_or_create_by(token: "JRRTOLKIEN")
  end

  def process
    processor = SentenceProcessor.new(@file.read, @user.id)
    processor.add_seeds
    processor.create_sequences
  end

  def self.seed
    Dir[Rails.root.join("lib", "texts", "lotr", "*.txt")].each do |book|
      new(book).process
    end
  end

  def self.wipe_data
    user = User.find_or_create_by(token: "JRRTOLKIEN")
    user.sequences.delete_all
    user.seeds.delete_all
  end
end