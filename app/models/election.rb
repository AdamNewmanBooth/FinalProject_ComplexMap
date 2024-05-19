# == Schema Information
#
# Table name: elections
#
#  id         :integer          not null, primary key
#  year       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Election < ApplicationRecord
  has_many  :election_subcircuits, class_name: "ElectionSubcircuit", foreign_key: "election_id", dependent: :destroy
  has_many :subcircuits, through: :election_subcircuits, source: :subcircuit
  has_many :vacancies, through: :election_subcircuits, source: :vacancies
  validates :year, presence: true
  validates :year, uniqueness: true

end
