Rails.application.routes.draw do
  root 'robots#show'
  post 'command', to: 'robots#command'
end

