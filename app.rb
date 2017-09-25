require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/words')

get('/') do
  @words_list = Word.all()
  erb(:index)
end

post('/') do
  name = params["name"]
  word = Word.new(:word => name, :definition => [])
  word.save()
  @words_list = Word.all()
  erb(:index)
end


get('/definitions/:id') do
  @word = Word.find(params[:id])
  erb(:word_definition)
end

post('/definitions/:id') do
  @word = Word.find(params[:id])
  new_definition = params["definition"]
  @word.add_definition(new_definition)
  erb(:word_definition)
end
