class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.references :machine, index: true
      t.string :name
      t.boolean :starts
      t.boolean :accepts

      t.timestamps
    end
  end
end
