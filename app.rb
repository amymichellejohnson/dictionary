require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require("./lib/dictionary")

get ("/") do
  erb(:index)
end

post ('/list_summary')
 word = params.fetch("word")
 definition = params.fetch("definition")
 Term.new(word, definition).save()
 @term = Term.all()
 erb(:list_summary)
