feature 'attack confirmation' do
  scenario 'received confirmation after player 1 attacks' do
    sign_in_and_play
    click_button "Attack"
    expect(page).to have_content("George attacked Ellie ")
  end
  scenario 'received confirmation after player 2 attacks' do
    sign_in_and_play
    attack_and_continue
    click_button "Attack"
    expect(page).to have_content("Ellie attacked George ")
  end
end
