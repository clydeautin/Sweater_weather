require "rails_helper"

RSpec.describe 'Sessions Requests' do

  it 'can log in a user with valid credentials' do
    post "/api/v1/users", params: { email: "user@example.com", password: "pass1234", password_confirmation: "pass1234" }
    expect(response.status).to eq(200)
    post "/api/v1/sessions", params: { email: "user@example.com", password: "pass1234" }
    # require 'pry'; binding.pry
    json = JSON.parse(response.body, symbolize_names: true)
    
    expect(response.status).to eq(200)
  end

  it 'will not login if user does not exist' do
    post "/api/v1/sessions", params: { email: "bad@user.com", password: "pass1234" }
    expect(response.status).to eq(401)
  end

  it 'will not login if password does not match' do
    post "/api/v1/users", params: { email: "user@example.com", password: "pass1234", password_confirmation: "pass1234" }
    expect(response.status).to eq(200)
    post "/api/v1/sessions", params: { email: "user@example.com", password: "pass1234569778" }
    expect(response.status).to eq(401)
  end
end