class VacancyCandidatesController < ApplicationController
  def index
    matching_vacancy_candidates = VacancyCandidate.all

    @list_of_vacancy_candidates = matching_vacancy_candidates.order({ :created_at => :desc })

    render({ :template => "vacancy_candidates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_vacancy_candidates = VacancyCandidate.where({ :id => the_id })

    @the_vacancy_candidate = matching_vacancy_candidates.at(0)

    render({ :template => "vacancy_candidates/show" })
  end

  def create
    the_vacancy_candidate = VacancyCandidate.new
    the_vacancy_candidate.candidate_id = params.fetch("query_candidate_id")
    the_vacancy_candidate.vacancy_id = params.fetch("query_vacancy_id")
    the_vacancy_candidate.party_id = params.fetch("query_party_id")
    the_vacancy_candidate.suburban_vote = params.fetch("query_suburban_vote")
    the_vacancy_candidate.chicago_vote = params.fetch("query_chicago_vote")
    the_vacancy_candidate.total_vote = params.fetch("query_total_vote")
    the_vacancy_candidate.suburban_percentage = params.fetch("query_suburban_percentage")
    the_vacancy_candidate.chicago_percentage = params.fetch("query_chicago_percentage")
    the_vacancy_candidate.total_percentage = params.fetch("query_total_percentage")

    if the_vacancy_candidate.valid?
      the_vacancy_candidate.save
      redirect_to("/vacancy_candidates", { :notice => "Vacancy candidate created successfully." })
    else
      redirect_to("/vacancy_candidates", { :alert => the_vacancy_candidate.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_vacancy_candidate = VacancyCandidate.where({ :id => the_id }).at(0)

    the_vacancy_candidate.candidate_id = params.fetch("query_candidate_id")
    the_vacancy_candidate.vacancy_id = params.fetch("query_vacancy_id")
    the_vacancy_candidate.party_id = params.fetch("query_party_id")
    the_vacancy_candidate.suburban_vote = params.fetch("query_suburban_vote")
    the_vacancy_candidate.chicago_vote = params.fetch("query_chicago_vote")
    the_vacancy_candidate.total_vote = params.fetch("query_total_vote")
    the_vacancy_candidate.suburban_percentage = params.fetch("query_suburban_percentage")
    the_vacancy_candidate.chicago_percentage = params.fetch("query_chicago_percentage")
    the_vacancy_candidate.total_percentage = params.fetch("query_total_percentage")

    if the_vacancy_candidate.valid?
      the_vacancy_candidate.save
      redirect_to("/vacancy_candidates/#{the_vacancy_candidate.id}", { :notice => "Vacancy candidate updated successfully."} )
    else
      redirect_to("/vacancy_candidates/#{the_vacancy_candidate.id}", { :alert => the_vacancy_candidate.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_vacancy_candidate = VacancyCandidate.where({ :id => the_id }).at(0)

    the_vacancy_candidate.destroy

    redirect_to("/vacancy_candidates", { :notice => "Vacancy candidate deleted successfully."} )
  end
end
