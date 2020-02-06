class CreateStralls < ActiveRecord::Migration[6.0]
  def change
    create_table :stralls do |t|
      t.datetime :date
      t.belongs_to :city, index: true
      t.belongs_to :dogsitter, index: true
      t.belongs_to :dog, index: true
      t.timestamps
    end
  end
end
