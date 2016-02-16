require 'sinatra'

get '/list/:dir' do
  list_files(params[:dir])
end

def list_files(dir)
  files = Dir["/var/www/kw/*"]
  files2 = Dir.entries("/var/www/kw/thelifeofpablo")
  puts files2
end
