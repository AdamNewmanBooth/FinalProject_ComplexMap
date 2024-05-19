# == Schema Information
#
# Table name: vacancy_candidates
#
#  id                  :integer          not null, primary key
#  chicago_percentage  :float
#  chicago_vote        :integer
#  suburban_percentage :float
#  suburban_vote       :integer
#  total_percentage    :float
#  total_vote          :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  candidate_id        :integer
#  party_id            :integer
#  vacancy_id          :integer
#
class VacancyCandidate < ApplicationRecord
end
