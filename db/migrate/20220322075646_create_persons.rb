class CreatePersons < ActiveRecord::Migration[5.2]
  def change
    create_table :persons do |t|
      t.string :person_name
      t.string :person_phone
      t.string :date_time
      t.string :teacher
      t.string :color
    
      t.timestamps
    end
  end
end
