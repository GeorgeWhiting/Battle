feature 'game should end' do
  scenario 'when 0 hitpoints are reached' do
    sign_in_and_play
    18.times do
      attack_and_continue
    end
    click_button "Attack"
    expect(page).to have_content("Ellie loses")
  end
end
