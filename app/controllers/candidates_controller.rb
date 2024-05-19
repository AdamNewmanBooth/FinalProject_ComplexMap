class CandidatesController < ApplicationController
  def index
    matching_candidates = Candidate.all

    @list_of_candidates = matching_candidates.order({ :created_at => :desc })

    render({ :template => "candidates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_candidates = Candidate.where({ :id => the_id })

    @the_candidate = matching_candidates.at(0)

    render({ :template => "candidates/show" })
  end

  def create
    the_candidate = Candidate.new
    the_candidate.first_name = params.fetch("query_first_name")
    the_candidate.last_name = params.fetch("query_last_name")

    if the_candidate.valid?
      the_candidate.save
      redirect_to("/candidates", { :notice => "Candidate created successfully." })
    else
      redirect_to("/candidates", { :alert => the_candidate.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_candidate = Candidate.where({ :id => the_id }).at(0)

    the_candidate.first_name = params.fetch("query_first_name")
    the_candidate.last_name = params.fetch("query_last_name")

    if the_candidate.valid?
      the_candidate.save
      redirect_to("/candidates/#{the_candidate.id}", { :notice => "Candidate updated successfully."} )
    else
      redirect_to("/candidates/#{the_candidate.id}", { :alert => the_candidate.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_candidate = Candidate.where({ :id => the_id }).at(0)

    the_candidate.destroy

    redirect_to("/candidates", { :notice => "Candidate deleted successfully."} )
  end
end
