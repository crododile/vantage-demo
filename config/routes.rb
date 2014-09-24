Rails.application.routes.draw do
  root to: "projects#index"
  resources :projects
  get "pi/:pi", to: "projects#pi"
  get "pr/:projectnumber",  to: "projects#pr"
  get "enter", to: "projects#enter"
end
