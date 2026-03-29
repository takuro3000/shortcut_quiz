class QuizzesController < ApplicationController
  before_action :set_quiz, only: [:show]

  def show
    @next_quiz = Quiz.where('id > ?', @quiz.id).order(:id).first
  end

  private

  def set_quiz
    @quiz = Quiz.find(params[:id])
  end
end
