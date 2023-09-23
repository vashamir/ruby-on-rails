# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'Manipulating with model Recipe' do

    it 'create Recipe and check valid' do
        user = User.create(email: "amir@mail.ru", password: "111111", password_confirmation: "111111")
      recipe = Recipe.create(title: "Example", receipe_text: "Example Example Example Example Example Example Example Example Example Example Example Example Example Example Example Example ", user_id: user.id)
      expect(recipe).to be_valid
    end

    it 'create Recipe and check invalid' do
      recipe = Recipe.create(title: "Example2", receipe_text: "Example Example Example Example Example Example Example Example Example Example Example Example Example Example Example Example ")
      expect(recipe).to be_invalid
    end

    it 'create new Recipe without params and try to save it' do
      expect(Recipe.create.save).to be_falsey
    end

    it 'create new Recipe and try to find it' do
        user = User.create(email: "amir@mail.ru", password: "111111", password_confirmation: "111111")
      recipe = Recipe.create(title: "Example2", receipe_text: "Example Example Example Example Example Example Example Example Example Example Example Example Example Example Example Example ", user_id: user.id)
        expect(Recipe.find_by(title: "Example2")).to eq(recipe)
    end

    it 'create new Recipe and try to find it by id' do
        user = User.create(email: "amir@mail.ru", password: "111111", password_confirmation: "111111")
      recipe = Recipe.create(title: "Example3", receipe_text: "Example Example Example Example Example Example Example Example Example Example Example Example Example Example Example Example ", user_id: user.id)
        expect(Recipe.find_by(id: 1)).to eq(recipe)
    end

    
  end

  
end