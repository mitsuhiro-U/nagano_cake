class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    def configure_permitted_parameters
         devise_parameter_sanitizer.permit(:sign_up, keys: [
        :last_name,
        :first_name, 
        :last_name_kana, 
        :first_name_kana, 
        :postal_code,
        :address,
        :telephone_number,
        :is_active
        ])
    end
    
    def after_sign_in_path_for(resource)
        case resource
        when Admin
            admin_top_path
        when Customer
            top_path
        end
    end
    
    def after_sign_out_path_for(resource)
        #byebug
        case resource
        when :admin
            new_admin_session_path
        when :customer
            top_path
        end
    end
    

    
end
