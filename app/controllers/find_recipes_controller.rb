# frozen_string_literal: true

# class
class FindRecipesController < ApplicationController
  def show
    @recipes = Recipe.where('title LIKE ?', "%#{Recipe.sanitize_sql_like(params[:title])}%")
  end
end
