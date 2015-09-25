require 'rails_helper'

describe "user profile" do
  
  before do
    @user = create(:user)
    visit new_user_session_path
   
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
        
    click_button('Log in')
  end
  
  it "is shown after sign in" do
    expect(current_path).to eq(user_path(@user))
  end
  
  it "displays accurate user-specific information" do
    expect(page).to have_content(@user.username)
    expect(page).to have_content(@user.email)
    expect(page).to have_content((@user.created_at).to_formatted_s(:long_ordinal))
    expect(page).to have_content(@user.last_sign_in_at)
  end
end