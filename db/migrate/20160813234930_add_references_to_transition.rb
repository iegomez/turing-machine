class AddReferencesToTransition < ActiveRecord::Migration
  def change
  	add_reference :transitions, :in_state, references: :states, index: true
  	add_reference :transitions, :out_state, references: :states, index: true
  end
end
