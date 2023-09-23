# frozen_string_literal: true

# class
class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def create
    @recipe = Recipe.new(title: params[:title], receipe_text: params[:recipe], user_id: current_user.id,
                         image: params[:image])
    if @recipe.save
      redirect_to @recipe
    else
      render 'new'
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(title: params[:title], receipe_text: params[:receipe_text], image: params[:image])
      redirect_to @recipe
    else
      render 'edit'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])

    @recipe.destroy
    redirect_to recipes_path
  end
end
