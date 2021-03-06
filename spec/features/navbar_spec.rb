feature "Nav bar specs" do
  scenario 'Shows the right buttons when signed in' do
    sign_up
    expect(page).to have_selector(:link_or_button, 'Sign out')
    expect(page).to have_content('List a space')
    expect(page).to have_content('View My Requests')
    expect(page).to have_content('View My Bookings')
  end

  scenario 'Shows the sign in button when going to root sign up page' do
    visit('/')
    expect(page).to have_content('Sign In')
    expect(page).not_to have_content('List Space')
    expect(page).not_to have_content('View My Requests')
    expect(page).not_to have_content('View My Bookings')
  end

  scenario 'Shows the sign up button when not signed in on spaces page' do
    visit('/spaces')
    expect(page).to have_content('Sign Up')
    expect(page).to have_content('Sign In')
    expect(page).not_to have_content('List Space')
    expect(page).not_to have_content('View My Requests')
    expect(page).not_to have_content('View My Bookings')
  end
end
