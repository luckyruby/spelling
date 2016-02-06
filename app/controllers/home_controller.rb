class HomeController < ApplicationController
  
  def index
    @word = Word.find_by_sql("select id, word from words where active is true offset floor(random()*(select count(*) from words where active is true)) limit 1").first
  end

end
