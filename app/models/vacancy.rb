# == Schema Information
#
# Table name: vacancies
#
#  id                     :integer          not null, primary key
#  chicago_vote           :integer
#  name                   :string
#  suburban_vote          :integer
#  total_vote             :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  election_subcircuit_id :integer
#  losing_candidate_id    :integer
#  vacating_candidate_id  :integer
#  winning_candidate_id   :integer
#
class Vacancy < ApplicationRecord
end
