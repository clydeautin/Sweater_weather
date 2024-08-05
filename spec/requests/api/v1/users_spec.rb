require "rails_helper"

RSpec.describe 'User API' do
  before(:each) do
    @valid_attributes = {
      email: "user@example.com",
      password: "pass1234",
      password_confirmation: "pass1234"
    }
  end

  it 'creates a new user' do
    post "/api/v1/users", params: { email: "user@example.com", password: "pass1234", password_confirmation: "pass1234" }
    expect(User.last.email).to eq("user@example.com")
    expect(User.last.id).to be_an Integer

  end

  it 'renders a JSON response with the new user' do
    post "/api/v1/users", params: { email: "user@example.com", password: "pass1234", password_confirmation: "pass1234" }

    json_response = JSON.parse(response.body, symbolize_names: true)

    expect(json_response[:data][:type]).to eq('user')
    expect(json_response[:data][:attributes][:email]).to eq('user@example.com')
    expect(json_response[:data][:attributes][:api_key]).to be_present
  end

  describe 'sad path' do
    it 'does not create a new user' do
      post "/api/v1/users", params: { email: "happy@example.com", password: "pass1234", password_confirmation: "pass1234" }
      post "/api/v1/users", params: { email: "sad@example.com", password: "pass1234", password_confirmation: "lolsike" }

      expect(User.last.email).to eq("happy@example.com")
    end
  end
end