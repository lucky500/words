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

# get('/list') do
#   @words_list = Word.new()
#   @words_list = @words_list.initial_words
#   erb(:list)
# end
#
# get('/detail/:id') do
#   "#{params[:id]}"
#   @words_list = Word.new()
#   @words_list = @words_list.initial_words
#   erb(:detail)
# end
#
# post "/detail/:id" do
#     @new_definition = params[:new_definition]
#     erb(:detail)
# end
