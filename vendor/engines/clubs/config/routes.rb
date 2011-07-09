::Refinery::Application.routes.draw do
  resources :clubs, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :clubs, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
