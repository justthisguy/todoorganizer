Rails.application.routes.draw do

  ###
  # Common pages *
  ###
  get "home"    => "pages#home",    as: "home"
  get "welcome" => "pages#welcome", as: "welcome"
  get "about"   => "pages#about",   as: "about"
  get "contact" => "pages#contact", as: "contact"
  get "terms"   => "pages#terms",   as: "terms"
  get "privacy" => "pages#privacy", as: "privacy"

  ###
  # root path depends on authentication
  ###
  # authenticated :user do
  #   root to: "pages#home", as: :authenticated_root
  # end

  # unauthenticated do
    root to: "pages#welcome"
  # end
end
