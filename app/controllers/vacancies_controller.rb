class VacanciesController < ApplicationController
  def index
    matching_vacancies = Vacancy.all

    @list_of_vacancies = matching_vacancies.order({ :created_at => :desc })

    render({ :template => "vacancies/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_vacancies = Vacancy.where({ :id => the_id })

    @the_vacancy = matching_vacancies.at(0)

    render({ :template => "vacancies/show" })
  end

  def create
    the_vacancy = Vacancy.new
    the_vacancy.election_subcircuit_id = params.fetch("query_election_subcircuit_id")
    the_vacancy.vacating_candidate_id = params.fetch("query_vacating_candidate_id")
    the_vacancy.name = params.fetch("query_name")
    the_vacancy.suburban_vote = params.fetch("query_suburban_vote")
    the_vacancy.chicago_vote = params.fetch("query_chicago_vote")
    the_vacancy.total_vote = params.fetch("query_total_vote")
    the_vacancy.winning_candidate_id = params.fetch("query_winning_candidate_id")
    the_vacancy.losing_candidate_id = params.fetch("query_losing_candidate_id")

    if the_vacancy.valid?
      the_vacancy.save
      redirect_to("/vacancies", { :notice => "Vacancy created successfully." })
    else
      redirect_to("/vacancies", { :alert => the_vacancy.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_vacancy = Vacancy.where({ :id => the_id }).at(0)

    the_vacancy.election_subcircuit_id = params.fetch("query_election_subcircuit_id")
    the_vacancy.vacating_candidate_id = params.fetch("query_vacating_candidate_id")
    the_vacancy.name = params.fetch("query_name")
    the_vacancy.suburban_vote = params.fetch("query_suburban_vote")
    the_vacancy.chicago_vote = params.fetch("query_chicago_vote")
    the_vacancy.total_vote = params.fetch("query_total_vote")
    the_vacancy.winning_candidate_id = params.fetch("query_winning_candidate_id")
    the_vacancy.losing_candidate_id = params.fetch("query_losing_candidate_id")

    if the_vacancy.valid?
      the_vacancy.save
      redirect_to("/vacancies/#{the_vacancy.id}", { :notice => "Vacancy updated successfully."} )
    else
      redirect_to("/vacancies/#{the_vacancy.id}", { :alert => the_vacancy.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_vacancy = Vacancy.where({ :id => the_id }).at(0)

    the_vacancy.destroy

    redirect_to("/vacancies", { :notice => "Vacancy deleted successfully."} )
  end
end
