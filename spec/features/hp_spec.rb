feature 'view hit points' do
  scenario 'shows player 2 hit points' do
    sign_in_and_play

    expect(page).to have_content("100 HP")
  end
  scenario 'reduces player 2s hp by 10' do
    sign_in_and_play
    click_button "Attack"
    click_button "Continue"
    expect(page).to have_content("Ellie : 90 HP")
    expect(page).not_to have_content("Ellie : 100 HP")
  end
end
