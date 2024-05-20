Rails.application.routes.draw do

  # Routes for the Vacancy candidate resource:

  # CREATE
  post("/insert_vacancy_candidate", { :controller => "vacancy_candidates", :action => "create" })
          
  # READ
  get("/vacancy_candidates", { :controller => "vacancy_candidates", :action => "index" })
  
  get("/vacancy_candidates/:path_id", { :controller => "vacancy_candidates", :action => "show" })
  
  # UPDATE
  
  post("/modify_vacancy_candidate/:path_id", { :controller => "vacancy_candidates", :action => "update" })
  
  # DELETE
  get("/delete_vacancy_candidate/:path_id", { :controller => "vacancy_candidates", :action => "destroy" })

  #------------------------------

  # Routes for the Election subcircuit resource:

  # CREATE
  post("/insert_election_subcircuit", { :controller => "election_subcircuits", :action => "create" })
          
  # READ
  get("/election_subcircuits", { :controller => "election_subcircuits", :action => "index" })
  
  get("/election_subcircuits/:path_id", { :controller => "election_subcircuits", :action => "show" })
  
  # UPDATE
  
  post("/modify_election_subcircuit/:path_id", { :controller => "election_subcircuits", :action => "update" })
  
  # DELETE
  get("/delete_election_subcircuit/:path_id", { :controller => "election_subcircuits", :action => "destroy" })

  #------------------------------

  # Routes for the Vacancy resource:

  # CREATE
  post("/insert_vacancy", { :controller => "vacancies", :action => "create" })
          
  # READ
  get("/", { :controller => "vacancies", :action => "index" })

  get("/vacancies", { :controller => "vacancies", :action => "index" })
  
  get("/vacancies/:path_id", { :controller => "vacancies", :action => "show" })
  
  # UPDATE
  
  post("/modify_vacancy/:path_id", { :controller => "vacancies", :action => "update" })
  
  # DELETE
  get("/delete_vacancy/:path_id", { :controller => "vacancies", :action => "destroy" })

  #------------------------------

  # Routes for the Subcircuit resource:

  # CREATE
  post("/insert_subcircuit", { :controller => "subcircuits", :action => "create" })
          
  # READ
  get("/subcircuits", { :controller => "subcircuits", :action => "index" })
  
  get("/subcircuits/:path_id", { :controller => "subcircuits", :action => "show" })
  
  # UPDATE
  
  post("/modify_subcircuit/:path_id", { :controller => "subcircuits", :action => "update" })
  
  # DELETE
  get("/delete_subcircuit/:path_id", { :controller => "subcircuits", :action => "destroy" })

  #------------------------------

  # Routes for the Party resource:

  # CREATE
  post("/insert_party", { :controller => "parties", :action => "create" })
          
  # READ
  get("/parties", { :controller => "parties", :action => "index" })
  
  get("/parties/:path_id", { :controller => "parties", :action => "show" })
  
  # UPDATE
  
  post("/modify_party/:path_id", { :controller => "parties", :action => "update" })
  
  # DELETE
  get("/delete_party/:path_id", { :controller => "parties", :action => "destroy" })

  #------------------------------

  # Routes for the Election resource:

  # CREATE
  post("/insert_election", { :controller => "elections", :action => "create" })
          
  # READ
  get("/elections", { :controller => "elections", :action => "index" })
  
  get("/elections/:path_id", { :controller => "elections", :action => "show" })
  
  # UPDATE
  
  post("/modify_election/:path_id", { :controller => "elections", :action => "update" })
  
  # DELETE
  get("/delete_election/:path_id", { :controller => "elections", :action => "destroy" })

  #------------------------------

  # Routes for the Candidate resource:

  # CREATE
  post("/insert_candidate", { :controller => "candidates", :action => "create" })
          
  # READ
  get("/candidates", { :controller => "candidates", :action => "index" })
  
  get("/candidates/:path_id", { :controller => "candidates", :action => "show" })
  
  # UPDATE
  
  post("/modify_candidate/:path_id", { :controller => "candidates", :action => "update" })
  
  # DELETE
  get("/delete_candidate/:path_id", { :controller => "candidates", :action => "destroy" })

  #------------------------------

  
end
