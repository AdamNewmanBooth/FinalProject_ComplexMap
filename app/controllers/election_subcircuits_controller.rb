class ElectionSubcircuitsController < ApplicationController
  def index
    matching_election_subcircuits = ElectionSubcircuit.all

    @list_of_election_subcircuits = matching_election_subcircuits.order({ :created_at => :desc })

    render({ :template => "election_subcircuits/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_election_subcircuits = ElectionSubcircuit.where({ :id => the_id })

    @the_election_subcircuit = matching_election_subcircuits.at(0)

    render({ :template => "election_subcircuits/show" })
  end

  def create
    the_election_subcircuit = ElectionSubcircuit.new
    the_election_subcircuit.election_id = params.fetch("query_election_id")
    the_election_subcircuit.subcircuit_id = params.fetch("query_subcircuit_id")

    if the_election_subcircuit.valid?
      the_election_subcircuit.save
      redirect_to("/election_subcircuits", { :notice => "Election subcircuit created successfully." })
    else
      redirect_to("/election_subcircuits", { :alert => the_election_subcircuit.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_election_subcircuit = ElectionSubcircuit.where({ :id => the_id }).at(0)

    the_election_subcircuit.election_id = params.fetch("query_election_id")
    the_election_subcircuit.subcircuit_id = params.fetch("query_subcircuit_id")

    if the_election_subcircuit.valid?
      the_election_subcircuit.save
      redirect_to("/election_subcircuits/#{the_election_subcircuit.id}", { :notice => "Election subcircuit updated successfully."} )
    else
      redirect_to("/election_subcircuits/#{the_election_subcircuit.id}", { :alert => the_election_subcircuit.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_election_subcircuit = ElectionSubcircuit.where({ :id => the_id }).at(0)

    the_election_subcircuit.destroy

    redirect_to("/election_subcircuits", { :notice => "Election subcircuit deleted successfully."} )
  end
end
