class ApplicationController < ActionController::API
	include ActionController::MimeResponds
	include ActionController::ImplicitRender
	include ActionController::RequestForgeryProtection
	include ActionController::Rescue
	
	protect_from_forgery with: :null_session
	respond_to :json
end
