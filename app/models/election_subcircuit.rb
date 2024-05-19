# == Schema Information
#
# Table name: election_subcircuits
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  election_id   :integer
#  subcircuit_id :integer
#
class ElectionSubcircuit < ApplicationRecord
  belongs_to :election, required: true, class_name: "Election", foreign_key: "election_id"
  belongs_to :subcircuit, required: true, class_name: "Subcircuit", foreign_key: "subcircuit_id"
  has_many  :vacancies, class_name: "Vacancy", foreign_key: "election_subcircuit_id", dependent: :destroy
  validates :subcircuit_id, presence: true
  validates :subcircuit_id, uniqueness: { scope: ["election_id"] }
  validates :election_id, presence: true
end
