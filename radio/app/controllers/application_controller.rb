class ApplicationController < ActionController::Base
private

def current_man
   @current_man = Man.find_by_id(session[:man_id])

end
helper_method :current_man
  
end
