class Machine < ActiveRecord::Base
	has_one :alphabet, dependent: :destroy
	has_many :states, dependent: :destroy
	has_many :transitions, dependent: :destroy

	def start_state
		return self.states.where(:starts => true).first
	end

	def accept_states
		return self.states.where(:accepts => true)
	end

	def run_string(input, verbose)

		response_hash = {:accepts => false, :sequence => [], :tape => ""}
		current_pos = 0
		right_tape = input
		left_tape = ""
		current_state = self.start_state
		current_char = ""
		proceed = true
		accepts = false

		while proceed
			#Get the input symbol. For negative positions, check the left tape
			if current_pos >= 0
				current_char = right_tape[current_pos]
			else
				current_char = left_tape[-1*current_pos -1]
			end

			if current_char.nil?
				current_char = "B"
			end

			#Check that symbol belongs to the alphabet
			if self.alphabet.chars.where(char: current_char).count < 1
				response_hash[:accepts] = false
				break
			end

			#Check existance of a transition with current state and symbol
			transition = self.transitions.where(:in_state_id => current_state.id, :in_char => current_char).first
			if transition.nil?
				#Check if it's an acceptance state
				response_hash[:tape] = left_tape + right_tape
				if current_state.accepts
					response_hash[:accepts] = true
				else
					response_hash[:accepts] = false
				end
				proceed = false
			else
				if current_pos >= 0
					right_tape[current_pos] = transition.out_char
				else
					left_tape[-1*current_pos -1] = transition.out_char
				end
				if transition.direction == "right"
					current_pos += 1
				elsif transition.direction == "left"
					current_pos -= 1
				end
				current_state = transition.out_state

				#Write transition in verbose mode
				if verbose
					transition_str = "(#{transition.in_state.name}, #{transition.in_char}) -> (#{transition.out_state.name}, #{transition.out_char}, #{transition.direction})"
					response_hash[:sequence].push(transition_str)
				end

			end

		end

		return response_hash

	end

end
