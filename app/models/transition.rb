class Transition < ActiveRecord::Base
	belongs_to :in_state, class_name: 'State', foreign_key: 'in_state_id'
	belongs_to :out_state, class_name: 'State', foreign_key: 'out_state_id'
end
