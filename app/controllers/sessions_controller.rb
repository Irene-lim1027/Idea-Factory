class SessionsController < ApplicationController
       
    def new
    end

    def create
        @user=User.find_by_email params[:email]
            if @user && @user.authenticate(params[:password])
                session[:user_id]=@user.id
                flash[:success] = "Signed In"
                redirect_to root_path
            else
                flash[:alert]="Wrong email or password"
                render :new
            end
    end

    def destroy
        session[:user_id]=nil 
        flash[:success] = 'Successfully Signed Out'
        redirect_to root_path
        end 


end
