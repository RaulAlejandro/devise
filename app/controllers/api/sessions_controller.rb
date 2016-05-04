class Api::SessionsController < Devise::SessionsController


	#wrap_parameters :user
	#accepts_nested_attributes_for :password

	#respond_to :json

	  #before_action :authenticate_tin_usuario!  
	#respond_to :json

	def new
		#super
	end


	def create
	    session['user_auth'] = params[:user]
	    #puts YAML::dump( session['user_auth'] )

	    resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
	    #puts YAML::dump(sign_in(resource_name, resource))
	    #puts YAML::dump(request.xhr?)
	    message = I18n.t 'devise.sessions.signed_in'
	    if request.xhr?															#, :content => render_to_string(:layout => false, :partial => 'sessions/manager')
	     return render :json => {:success => true, :login => true, :data =>  {:message => message}, :user => current_user } 
	    #else
	     #respond_to do |format|
	       #format.html{redirect_to '/'}
	    # end
	    end
	    
	end



  #def create
  #  resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
  #  render :status => 200,
  #         :json => { :success => true,
  #                    :info => "Logged in",
  #                    :user => current_user
  #         }
  #end

	#def create
	  #  self.resource = warden.authenticate!(auth_options)
	   # set_flash_message(:notice, :signed_in) if is_flashing_format?
	    #sign_in(resource_name, resource)
	    #yield resource if block_given?
	    #respond_with resource, location: after_sign_in_path_for(resource)
	    #puts 'aqui'
	   # @resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
	    #@resource = warden.authenticate!(auth_options)
	    #puts YAML::dump(resource)
	#    super
	    #sign_in(resource_name, @resource)
		#respond_to do |format|
		 #  format.html { respond_with @resource, :location => after_sign_in_path_for(@resource) }
		   #format.js {  :success => true }

		    #render :status => 200,
		     #      :json => { :success => true,
		      #                :info => "Logged in",
		       #               :user => current_user
		        #   }

		#end


	    	# respond_to do |format|
		      #format.html{ super }
		      #format.json do
		      #  resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
		      #  return sign_in_and_redirect(resource_name, resource)
		      #end
		    

		    
		#    resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
		    #resource = User.find_for_database_authentication(email: params[:user][:email], password: params[:user][:password])
		 #   render :status => 200,
		  #         :json => { :success => true,
		   #                   :info => "Logged in",
		    #                  :user => current_user
		     #      }

		    
		    #resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
		    #resource = User.find_for_database_authentication(email: params[:user][:email], password: params[:user][:password])
		    #resource = warden.authenticate!(:socpe => :user)
		    #resource = warden.authenticate!(params[:user][:email], params[:user][:password])
		    #puts YAML::dump(resource)
			#puts YAML::dump(resource)
			#return invalid_login_attempt unless resource

			#if resource.valid_password?(params[:user][:password])
			   #sign_in :user, resource
			   #return render nothing: true
			#end
	        #invalid_login_attempt


   #end


    def failure
	    #user = User.find_by_email(session['user_auth'][:email])
	     message = I18n.t 'devise.failure.invalid'
	    #  if user =! nil || user.active_for_authentication?
	     #   flash[:error]= message unless request.xhr?
	     #else
	      # flash[:error]= user.inactive_message unless request.xhr?
	       #message = user.inactive_message    
	    # end
	    respond_to do |format|
	      format.json {render :json => {:authentication => 'failure', :data => {:message => message, :cause => 'invalid'} } }
	      format.html {redirect_to '/users/sign_in'}
	    end
    end


      # DELETE /resource/sign_out
    def destroy
    	super
   # warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
   # sign_out
   # render :status => 200,
    #       :json => { :success => true,
     #                 :info => "Logged out",
     #      }

    end

  #def failure
   # render :status => 401,
    #       :json => { :success => false,
     #                 :info => "Login Credentials Failed"
      #     }
  #end
  
end
