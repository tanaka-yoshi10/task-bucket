module SessionHelpers
  def signin(email, password, path = new_user_session_path)
    visit path if path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Log in'
  end
end
