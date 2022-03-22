class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.string :name

      t.timestamps
    end

    Teacher.create(:name => 'Valentina Ivanovna')
    Teacher.create(:name => 'Sergei Mikhailovich')
    Teacher.create(:name => 'Alina Sergeyevna')
  end
end
