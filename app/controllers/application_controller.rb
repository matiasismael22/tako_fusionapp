class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

# def after_sign_in_path_for(resource)
   
 #     if current_user.where(:profile_id => 1).any?
  #      root_path
   #   elsif current_user.where(:profile_id => 2).any?
    #   root_path
     # else
     #   dashboard_admin_path
    #  end
 # end
# def users
 #   current_user.users.ids.to_a
 # end
 #def authorize(profile)
 #   if(profiles & profile.to_a).any?
  #    true
   # else

     #redirect_to root_path

#    end
#  end
#  def is_admin
#    authorize([1]) # ID del perfil admins
#  end
#  def is_user
#    authorize([2]) # Id del perfil user
#  end
end
