require 'rails_helper'

include Warden::Test::Helpers
Warden.test_mode!

describe "Todo" do
  
  before do
    @user = create(:user)
    login_as(@user, scope: :user)
  end
  
  describe "creation" do
    it "allows user to create multiple todos by form" do
      
      visit user_path(@user)
      
      fill_in 'Create new todo', with: "Make appointments"
      click_button('Create')
      fill_in 'Create new todo', with: "File reports"
      click_button('Create')
      
      expect(page).to have_content("Make appointments")
      expect(page).to have_content("File reports")
      expect(page).to have_content("7") #checking days left method
    end
  end
  
  describe "deletion" do
    it "allows user to remove todos that are completed" do
      @item1 = create(:item, user: @user)
      @item2 = create(:item, name: "Be kind", user: @user)
     
      visit user_path(@user)
      
      expect(page).to have_content(@item1.name)
      expect(page).to have_content(@item2.name)
      
      click_link("deleteitem-#{@item1.id}")
      expect(page).to have_no_content(@item1.name)
      expect(page).to have_content(@item2.name)
      
      click_link("deleteitem-#{@item2.id}")
      expect(page).to have_no_content(@item1.name)
      expect(page).to have_no_content(@item2.name)
      
    end
  end
  
end
Warden.test_reset!
      
      