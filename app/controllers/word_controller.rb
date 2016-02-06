class WordController < ApplicationController

  def check
    word = Word.find params[:word_id]
    if params[:word].downcase == word.word
      flash[:notice] = "Correct!"
      word.update_attribute(:active, false)
    else
      flash[:error] = 'Wrong!'
    end
    redirect_to root_path
  end
end
