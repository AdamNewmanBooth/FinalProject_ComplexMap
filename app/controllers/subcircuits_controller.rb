class SubcircuitsController < ApplicationController
  def index
    matching_subcircuits = Subcircuit.all

    @list_of_subcircuits = matching_subcircuits.order({ :created_at => :desc })

    render({ :template => "subcircuits/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_subcircuits = Subcircuit.where({ :id => the_id })

    @the_subcircuit = matching_subcircuits.at(0)

    render({ :template => "subcircuits/show" })
  end

  def create
    the_subcircuit = Subcircuit.new
    the_subcircuit.number = params.fetch("query_number")

    if the_subcircuit.valid?
      the_subcircuit.save
      redirect_to("/subcircuits", { :notice => "Subcircuit created successfully." })
    else
      redirect_to("/subcircuits", { :alert => the_subcircuit.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_subcircuit = Subcircuit.where({ :id => the_id }).at(0)

    the_subcircuit.number = params.fetch("query_number")

    if the_subcircuit.valid?
      the_subcircuit.save
      redirect_to("/subcircuits/#{the_subcircuit.id}", { :notice => "Subcircuit updated successfully."} )
    else
      redirect_to("/subcircuits/#{the_subcircuit.id}", { :alert => the_subcircuit.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_subcircuit = Subcircuit.where({ :id => the_id }).at(0)

    the_subcircuit.destroy

    redirect_to("/subcircuits", { :notice => "Subcircuit deleted successfully."} )
  end
end
