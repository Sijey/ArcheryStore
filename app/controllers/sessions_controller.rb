class SessionsController < ApplicationController
	skip_before_action :authorize
  def new
  end

  def create
  	admin = Admin.find_by(name: params[:name])
  	if admin and admin.authenticate(params[:password])
  		session[:admin_id] = admin.id
  		redirect_to administrator_url
  	else
  		redirect_to login_url, alert: 'Неправельное имя или пароль'
  	end
  end

  def destroy
  	session[:admin_id] = nil
  	redirect_to root_url, notice: "Сеанс работы завершен"
  end
end
