# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:email_user) { 'oleg-nsk@mail.ru' }
  let(:password_user) { 'ts6GwTyLCzEYNmG' }
  describe 'Manipulating with model User' do
    it 'create User and check valid' do
      user = User.create(email: email_user, password: password_user, password_confirmation: password_user)
      expect(user).to be_valid
    end

    it 'create User and check invalid' do
      user = User.create(email: email_user, password: password_user, password_confirmation: "#{password_user}1")
      expect(user).to be_invalid
    end

    it 'create new User without params and try to save it' do
      expect(User.create.save).to be_falsey
    end

    it 'create new User and try to find it' do
      user = User.create(email: email_user, password: password_user, password_confirmation: password_user)
      expect(User.find_by(email: email_user)).to eq(user)
    end

    it 'create new User and try to find it by id' do
      user = User.create(email: email_user, password: password_user, password_confirmation: password_user)
      expect(User.find_by(id: user.id)).to eq(user)
    end

    
  end

  

  
end