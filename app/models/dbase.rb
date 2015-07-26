class Dbase < ActiveRecord::Base
  require 'csv'

  def self.upload(file)
    Dbase.delete_all
    CSV.foreach(file.path, headers: true) do |row|
      dbase_hash = row.to_hash
      Dbase.create!(dbase_hash)
    end
  end
end
