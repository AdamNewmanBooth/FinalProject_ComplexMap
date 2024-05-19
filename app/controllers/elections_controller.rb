class ElectionsController < ApplicationController
  def index
    matching_elections = Election.all

    @list_of_elections = matching_elections.order({ :created_at => :desc })

    render({ :template => "elections/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_elections = Election.where({ :id => the_id })

    @the_election = matching_elections.at(0)

    render({ :template => "elections/show" })
  end

  def create
    the_election = Election.new
    the_election.year = params.fetch("query_year")

    if the_election.valid?
      the_election.save
      redirect_to("/elections", { :notice => "Election created successfully." })
    else
      redirect_to("/elections", { :alert => the_election.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_election = Election.where({ :id => the_id }).at(0)

    the_election.year = params.fetch("query_year")

    if the_election.valid?
      the_election.save
      redirect_to("/elections/#{the_election.id}", { :notice => "Election updated successfully."} )
    else
      redirect_to("/elections/#{the_election.id}", { :alert => the_election.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_election = Election.where({ :id => the_id }).at(0)

    the_election.destroy

    redirect_to("/elections", { :notice => "Election deleted successfully."} )
  end
end
