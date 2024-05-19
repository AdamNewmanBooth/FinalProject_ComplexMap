# == Schema Information
#
# Table name: subcircuits
#
#  id         :integer          not null, primary key
#  number     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Subcircuit < ApplicationRecord
  has_many  :election_subcircuits, class_name: "ElectionSubcircuit", foreign_key: "subcircuit_id", dependent: :destroy
  has_many :elections, through: :election_subcircuits, source: :election
  has_many :vacancies, through: :election_subcircuits, source: :vacancies
  validates :number, presence: true
  validates :number, uniqueness: true
end
