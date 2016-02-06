require 'http'

def import_words(filename, difficulty, grade, word_bank)
  HTTP.persistent "http://api.voicerss.org" do |http|
    IO.foreach("db/data/#{filename}") do |word|
      word.strip!.downcase!
      next if word_bank[word]
      params = {
        hl: 'en-us',
        key: CONFIG[:voicerss][:key],
        src: word,
        r: '-5',
        c: 'AAC',
        f: '48khz_16bit_stereo'
      }
      speech = http.get("/", params: params).to_s
      if speech =~ /ERROR/i
        puts "API ERROR!"
        abort
      else
        f = File.new("public/speech/#{word}.aac",'w')
        f.syswrite speech
        f.close
        Word.create!(word: word, difficulty: difficulty, grade: grade)
      end
    end
  end
end

word_bank = Hash[Word.pluck(:word).map {|i| [i,true]}]
import_words('easy_words.txt', 'easy', 'first', word_bank)
import_words('med_words.txt', 'medium', 'first', word_bank)
import_words('hard_words.txt', 'hard', 'first', word_bank)
