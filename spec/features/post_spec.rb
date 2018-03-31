require 'rails_helper'

describe 'navigate' do
	describe 'index' do
    it 'can be reached' do
      visit posts_path
      expect(page.status_code).to eq(200)
    end

    it 'has content of posts' do
      visit posts_path
      expect(page).to have_content(/Posts/)
    end
  end

  describe 'creation' do
    before do
      user = User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Jon", last_name: "Snow")
      login_as(user, scope: :user)
      visit new_post_path
    end 
    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do
      fill_in 'post[date]', with: Date.today.to_s
      fill_in 'post[rationale]', with: 'something'

      click_on "Save"

      expect(page).to have_content('something')
    end

    it 'will have a user associated' do
      fill_in 'post[date]', with: Date.today.to_s
      fill_in 'post[rationale]', with: 'user_associated'

      click_on "Save"

      expect(User.last.posts.last.rationale).to eq('user_associated')
    end
  end
end