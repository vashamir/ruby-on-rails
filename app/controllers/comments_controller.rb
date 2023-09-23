# frozen_string_literal: true

# class
class CommentsController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.create(body: params[:body], user_id: current_user.id,
                                       recipe_id: @recipe.id)
    redirect_to recipe_path(@recipe)
  end

  # def destroy
  #     @comment = Comment.find(params[:id])

  #     @comment.destroy
  #     redirect_to recipe_path
  # end
end
