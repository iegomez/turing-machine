class Alphabet < ActiveRecord::Base
  belongs_to :machine
  has_many :chars, dependent: :destroy
end
