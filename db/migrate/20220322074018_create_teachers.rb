class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.string :name

      t.timestamps
    end

    Teacher.create(:name => 'Валентина Иванова')
    Teacher.create(:name => 'Сергей Михайлович')
    Teacher.create(:name => 'Алина Сергеевна')
  end
end
