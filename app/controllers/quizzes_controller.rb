class QuizzesController < ApplicationController
  before_action :set_quiz, only: [:show]

  def show
  end

  private

  def set_quiz
    @quiz = Quiz.find(params[:id])
  end
end
