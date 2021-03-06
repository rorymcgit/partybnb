#implement tests for sign up - can't sign up w/o email etc

feature "sign up" do
  scenario "User signs ups, and increases user count by 1" do
    expect{sign_up}.to change(User, :count).by(1)
  end


  scenario "requires a matching confirmation password" do
    expect {sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
  end

  scenario "user is logged in on signup" do
    sign_up
    expect(current_path).to eq('/spaces')
    expect(page).to have_content("You are signed in, Azntastic")
  end
  scenario 'if user email already taken' do
    sign_up
    sign_up
    # expect(current_path).not_to eq('/spaces')
    # expect(page).not_to have_content("You are signed in, Azntastic")
    expect(page).to have_content("Email is already taken")
  end

  scenario 'Confirmation password is wrong' do
    sign_up(password: '123456', password_confirmation: '123')
    # expect(page).not_to have_content("You are signed in, Azntastic")
    expect(page).to have_content("Password does not match the confirmation")
  end
end
