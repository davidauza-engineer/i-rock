require 'rails_helper'

feature 'achievement page' do
  let(:user) { FactoryGirl.create(:user) }
  scenario 'achievement public page' do
    achievement = FactoryGirl.create(:achievement, title: 'Just did it', user: user)
    visit("/achievements/#{achievement.id}")

    expect(page).to have_content('Just did it')

    # To create multiple achievement objects:
    # achievements = FactoryGirl.create_list(:achievement, 3)
    # p achievements
  end

  scenario 'render markdown description' do
    achievement = FactoryGirl.create(:achievement, description: 'It *was* hard', user: user)
    visit("/achievements/#{achievement.id}")

    expect(page).to have_css('em', text: 'was')
  end
end 
