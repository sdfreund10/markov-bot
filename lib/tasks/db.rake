namespace :db do
  desc "seeds the database with JRR Tolkien text"
  task seed_tolkien: :environment do
    TolkienSeed.wipe_data
    TolkienSeed.seed
  end
end
