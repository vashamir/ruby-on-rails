# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Manipulating with model Comment' do

    it 'create Recipe and check valid' do
        user = User.create(email: "amir@mail.ru", password: "111111", password_confirmation: "111111")
        recipe = Recipe.create(title: "Example", receipe_text: "Example Example Example Example Example Example Example Example Example Example Example Example Example Example Example Example ", user_id: user.id)
        comment = Comment.create(body: "Super good", user_id: user.id, recipe_id: recipe.id)
        expect(recipe).to be_valid
    end

    it 'create Comment and check invalid' do
      comment = Comment.create(body: "Example2")
      expect(comment).to be_invalid
    end

    it 'create new Comment without params and try to save it' do
      expect(Comment.create.save).to be_falsey
    end

    it 'create new Comment and try to find it' do
        user = User.create(email: "amir@mail.ru", password: "111111", password_confirmation: "111111")
        recipe = Recipe.create(title: "Example", receipe_text: "Example Example Example Example Example Example Example Example Example Example Example Example Example Example Example Example ", user_id: user.id)
        comment = Comment.create(body: "Super good", user_id: user.id, recipe_id: recipe.id)
        expect(Comment.find_by(body: "Super good")).to eq(comment)
    end

    it 'create new Comment and try to find it by id' do
        user = User.create(email: "amir@mail.ru", password: "111111", password_confirmation: "111111")
        recipe = Recipe.create(title: "Example", receipe_text: "Example Example Example Example Example Example Example Example Example Example Example Example Example Example Example Example ", user_id: user.id)
        comment = Comment.create(body: "Super good", user_id: user.id, recipe_id: recipe.id)
        expect(Comment.find_by(id: 1)).to eq(comment)
    end

    
  end

  
end