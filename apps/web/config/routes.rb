get '/', to: 'home#index'

# GET /matches/:id
get '/matches/:id', to: 'matches#show'

## GET /matches # Nice to have
#get '/matches', to: 'matches#index'

# POST /matches
post '/matches', to: 'matches#create', as: :create_match

# PATCH /matches/:match_id/confirm
patch '/matches/:match_id/confirm', to: 'matches#confirm'

# DELETE /matches/:match_id
delete '/matches/:id', to: 'matches#destroy'

# GET /matches/:match_id/scores/:id
get '/matches/:match_id/scores/:user_id', to: 'scores#show'

# POST /matches/:match_id/scores/:id
post '/matches/:match_id/scores/:user_id', to: 'scores#create'

# GET /users/:id # Nice to have
get '/users/:id', to: 'users#show'

# POST /users
post '/user', to: 'users#create'
