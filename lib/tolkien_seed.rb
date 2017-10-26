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
    User.find_or_create_by(token: "JRRTOLKIEN").clear_data

    Dir[Rails.root.join("lib", "texts", "lotr", "*.txt")].each do |book|
      puts "Adding #{book}"
      new(book).process
    end
  end
end
