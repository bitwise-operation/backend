get '/', to: 'home#index'

get '/matches/confirmed', to: 'matches#confirmed', as: :confirmed_matches

# GET /matches/:id
get '/matches/:id', to: 'matches#show'

# GET /matches # Nice to have
get '/matches', to: 'matches#index', as: :index_matches

# POST /matches
post '/matches', to: 'matches#create', as: :create_match

# post /matches/:match_id/confirm
post '/matches/:id/confirm', to: 'matches#confirm', as: :confirm_match

# post /matches/:id/schedule
post '/matches/:id/schedule', to: 'matches#schedule', as: :schedule_match

# post /matches/:id/start
post '/matches/:id/start', to: 'matches#start', as: :start_match

# post /matches/:id/complete
post '/matches/:id/complete', to: 'matches#complete', as: :complete_match

# post /matches/:id/draw
post '/matches/:id/draw', to: 'matches#draw', as: :draw_match

# DELETE /matches/:match_id
delete '/matches/:id', to: 'matches#destroy'

# GET /matches/:match_id/scores/:id
get '/matches/:match_id/score', to: 'scores#show', as: :show_score

# POST /matches/:match_id/scores/:id
post '/matches/:match_id/scores/:user_id', to: 'scores#create', as: :increment_score

# GET /users/:id # Nice to have
get '/users/:id', to: 'users#show'

# POST /users
post '/user', to: 'users#create'
