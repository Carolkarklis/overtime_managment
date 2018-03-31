require 'rails_helper'

RSpec.describe Post, type: :model do
	describe 'Creation' do
		it 'can be created' do
      user = User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Jon", last_name: "Snow")
			post = Post.create(date: Date.today, rationale:'whatever', user: user)
			expect(post).to be_valid
		end

    it 'cannot be created without data' do 
      post = Post.create
      expect(post).to_not be_valid
    end
	end
end
