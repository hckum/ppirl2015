class CreateDbases < ActiveRecord::Migration
  def change
    create_table :dbases do |t|
      t.string :fname
      t.string :lname
      t.string :race
      t.string :gender
      t.string :ssn
      t.string :dob

      t.timestamps null: false
    end
  end
end
