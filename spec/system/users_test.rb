# frozen_string_literal: true

require "rails_helper"

describe Users::SessionsController, type: :system do

  context 'when user doesn\'t exist' do
    before do
      @user = FactoryBot.build(:user) 
    end
    it "lets me sign up" do
      visit new_user_registration_path

      fill_in 'Name', with: @user.name
      fill_in 'Email', with: @user.email
      fill_in 'user[password]', with: @user.password 
      fill_in 'user[password_confirmation]', with: @user.password 
      click_on 'Sign up'

      expect(page).to have_current_path(root_path)
      # if goes to /users then issue with form e.g. same password, email in use
    end
  end

  context 'when user does exist' do
    before do
      @user = FactoryBot.create(:user) 
    end
    # add login cases
  end
  
end
