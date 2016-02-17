require 'sinatra'
require 'pry'

set :bind, '0.0.0.0'

class UrlGenerator < Sinatra::Base
  get '/list' do
    prefix = params[:prefix]
    dir = params[:dir]
    filetype = params[:filetype]

    unless params[:play_command].nil?
      play_command = to_bool(params[:play_command])
    end

    list_files(prefix, dir, filetype, play_command)
  end

  def list_files(prefix, dir, filetype, play_command = false)
    # move to the dir passed in
    Dir.chdir(dir)

    puts play_command
    # Get all files of type filetype
    files = Dir.glob("**/*.#{filetype}")

    if play_command
      output = files.map{ |file| "!play #{prefix}/#{file}"}.join("<br>")
    else
      output = files.map{ |file| "#{prefix}/#{file}" }
    end
  end

  def to_bool(str)
    str.downcase == 'true' || str = '1'
  end
end
