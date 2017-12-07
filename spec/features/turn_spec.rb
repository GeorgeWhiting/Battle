feature 'switch turns' do
  scenario 'pressing the Continue button switches the turn on the play page' do
    sign_in_and_play
    click_button "Attack"
    click_button "Continue"
    expect(page).to have_content "Ellie's turn"
    expect(page).not_to have_content "George's turn"
  end
end

feature 'display turns' do
  scenario 'it displays whose turn it is' do
    sign_in_and_play
    expect(page).to have_content "George's turn"
  end
end
