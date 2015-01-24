require 'rails_helper'

RSpec.describe Api::V1::UsersController, :type => :controller do
	before(:each) { request.headers['Accept'] = "application/vnd.marketplace.v1" }

	describe "GET #show" do
		before(:each) do
			@user = FactoryGirl.create :user
			get :show, id: @user.id, format: :json
		end

		it "returns the information about a reporter on a hash" do
			user_response = JSON.parse(response.body, symbolize_names: true)
			expect(user_response[:email]).to eql @user.email
		end

		it { should respond_with 200 }
	end

	describe "POST #create" do
		context "success" do
			before(:each) do
				@user_attributes = FactoryGirl.attributes_for :user
				post :create, { user: @user_attributes}, format: :json
			end

			it "renders the json represention for user record just created" do
				user_response = JSON.parse(response.body, symbolize_names: true)
				expect(user_response[:email]).to eql @user_attributes[:email]
			end

			it { should respond_with 201 }
		end

		context "failure" do
			before(:each) do
				@user_attributes = FactoryGirl.attributes_for :user
				post :create, { user: @user_attributes}, format: :json
			end
		end
	end
end
