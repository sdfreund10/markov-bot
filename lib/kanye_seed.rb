# frozen_string_literal: true

class KanyeSeed
  KANYE_TOKEN = "KanyeWest".freeze
  def initialize(file)
    @file = file
    @user = User.find_by(token: KANYE_TOKEN)
  end

  def process_album
    song = ""
    File.open(@file, "r").each do |row|
      if row.include? "="
        add_song(song)
        song = ""
      else
        song += row
      end
    end
  end

  def add_song(song)
    processor = SentenceProcessor.new(song, @user.id)

    processor.add_seeds
    processor.create_sequences
  end

  def self.add_albums
    User.find_or_create_by(token: KANYE_TOKEN).clear_data

    Dir["lib/texts/kanye_lyrics/*.txt"].each do |album|
      new(album).process_album
    end
  end
end