# spec/requests/pages_spec.rb
require 'rails_helper'

RSpec.describe "Pages", type: :request do
  describe "GET /" do
    context "when signed in" do
      let!(:user) { FactoryBot.create(:user) }  # Create a user for testing
      before do
        sign_in user  # Sign in the user using Devise's helper
      end

      it "returns http success" do
        get "/"
        expect(response).to have_http_status(:success)
        expect(response.body).to include("Test")  # Adjust this based on your app's actual content
      end
    end

    context "when signed out" do
      it "redirects to sign in" do
        get "/"
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end

