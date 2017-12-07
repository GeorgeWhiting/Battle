require_relative '../../lib/app'
require 'capybara/rspec'

feature 'attack confirmation' do
  scenario 'received confirmation for attack' do
    sign_in_and_play

    click_button "Attack"

    expect(page).to have_content("Ellie was attacked")
  end
end
