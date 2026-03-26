Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resource :user_preference, only: [:show, :update]

      resources :exercises, only: [:index]
      resources :habit_templates, only: [:index]
      resources :monthly_goal_templates, only: [:index]

      resources :daily_tasks, only: [:index] do
        member do
          patch :complete
        end
        collection do
          get :generate
          get :stats
        end
      end

      resources :weekly_habits do
        member do
          patch :log_today
        end
      end

      resources :monthly_goals do
        member do
          post :log_entry
        end
      end

      get :lifetime_stats, to: "stats#lifetime"
    end
  end

  get "up", to: proc { [200, {}, ["OK"]] }
end