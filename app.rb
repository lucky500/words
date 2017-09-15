require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/words')

get('/') do 
  @words_list = Words.new()
  @words_list = @words_list.initial_words
  erb(:list)
end

get('/list') do 
  @words_list = Words.new()
  @words_list = @words_list.initial_words
  erb(:list)
end

