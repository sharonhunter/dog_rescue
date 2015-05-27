class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by_email(params[:email])
		#if user exists and password provided is correct
		if user && user.authenticate(params[:password])
			#save user id in browser cookie, so that login persists throughout site
			session[:user_id] = user.id
			redirect_to '/'
		else
			#if user's login does not work, return to login form
			flash[:error] = 'An error occured!'
			redirect_to '/login'
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to '/login'
	end
end
