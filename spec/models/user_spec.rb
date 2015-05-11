require 'rails_helper'

RSpec.describe User, type: :model do
  context 'role' do
    before(:all) do
      FactoryGirl.create(:user_role)
      FactoryGirl.create(:moderator_role)
      FactoryGirl.create(:admin_role)
    end

    it 'assigns user role' do
      User.create!(email: "user@funnypics.ru", password: 'password', 
                   password_confirmation: 'password', role: 'user', nick: 'user')
      expect(User.last.has_role?('user')).to be true
    end

    it 'assigns moderator role' do
      User.create!(email: "moderator@funnypics.ru", password: 'password', 
                   password_confirmation: 'password', role: 'moderator', nick: 'user')
      expect(User.last.has_role?('moderator')).to be true
    end

    it 'assigns admin role' do
      User.create!(email: "admin@funnypics.ru", password: 'password', 
                   password_confirmation: 'password', role: 'admin', nick: 'admin')
      expect(User.last.has_role?('moderator')).to be true
    end
  end
end
