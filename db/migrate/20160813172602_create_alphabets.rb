class CreateAlphabets < ActiveRecord::Migration
  def change
    create_table :alphabets do |t|
      t.references :machine, index: true

      t.timestamps
    end
  end
end
