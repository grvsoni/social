class Users::RegistrationsController < Devise::RegistrationsController
  set_tab :account
  layout "dashboard", :only => [:edit, :update]
end