class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :age
      t.string :gender
      t.string :breed
      t.string :secondary_breed
      t.string :heartworm_status
      t.string :temperament
      t.string :activity_level
      t.text :info
      t.date :available
      t.string :contact_name
      t.string :contact_phone

      t.timestamps
    end
  end
end
