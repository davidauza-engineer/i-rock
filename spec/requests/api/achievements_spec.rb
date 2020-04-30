require 'rails_helper'

RSpec.describe 'Achievements API', type: :request do
  it 'sends public achievements' do
    user = FactoryGirl.create(:user)
    public_achievement = FactoryGirl.create(:public_achievement, title: 'My achievement', user: user)
    private_achievement = FactoryGirl.create(:private_achievement, user: user)

    headers = { 'Content-Type' => 'application/vnd.api+json' }
    get '/api/achievements', headers: headers

    expect(response.status).to eq(200)
    json = JSON.parse(response.body)

    expect(json['data'].count).to eq(1)
    expect(json['data'][0]['type']).to eq('achievements')
    expect(json['data'][0]['attributes']['title']).to eq('My achievement')
  end
end