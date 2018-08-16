class CreateLandmarks < ActiveRecord::Migration
  def change
    create_table :landmarks do |t|
      t.string :name
      t.string :figure_id
      t.string :year_completed
    end
  end
end
