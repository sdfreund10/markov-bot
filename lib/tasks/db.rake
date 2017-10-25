namespace :db do
  desc "seeds the database with JRR Tolkien text"
  task seed_tolkien: :environment do
    TolkienSeed.seed
  end

  desc "seed database with Kanye West data"
  task seed_kanye: :environment do
    KanyeSeed.add_albums
  end
end
