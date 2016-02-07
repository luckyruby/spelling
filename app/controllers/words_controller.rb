class WordsController < ApplicationController

  def check
    word = Word.find params[:word_id]
    if params[:word].downcase == word.word
      flash[:notice] = "Correct!"
      word.update_attribute(:active, false)
    else
      flash[:error] = "Wrong. The word is spelled #{word.word}."
      Attempt.create!(attempt: params[:word], ip_address: request.remote_ip, word_id: params[:word_id])
    end
    redirect_to root_path
  end

  def incorrect
    @attempts = Attempt.order("created_at DESC")
  end

  def reset
    flash[:notice] = 'Active words reset'
    Word.update_all active: true
    redirect_to root_path
  end
end
