require 'rubygems'
require 'sinatra'
#setting
set :root, File.dirname(__FILE__)
set :public_folder, File.dirname(__FILE__) + '/stylesheets'
set :port, 4993

#template :layout do
 # haml :layout
#end
require 'rubygems'
require 'pdf/reader'
  
  #@filename = File.expand_path(File.dirname(__FILE__)) + "/../stylesheets/O'Reilly.HTML5.Up.and.Running.pdf"
 # @filename = File.expand_path(File.dirname(__FILE__)) + "/views/books/O'Reilly.HTML5.Up.and.Running.pdf"
  
get '/' do
  haml :index
end

get '/hanzi' do
  haml :'hanzi/index'
end

get '/hanzi/zwxmhz' do
  haml :'hanzi/zwxmhz'
end

get '/hanzi/wxwmhz' do
  haml :'hanzi/wxwmhz'
end

get '/books' do
 
  @filename = File.expand_path(File.dirname(__FILE__)) + "/../stylesheets/O'Reilly.HTML5.Up.and.Running.pdf"
  @filename = "/home/ney/todos/stylesheets/O'Reilly.HTML5.Up.and.Running.pdf"
  PDF::Reader.open(@filename) do |reader|
    @info = reader.info
    @metadata = reader.metadata
    #reader.pages.each do |page| 
    #  @text = page.text
    #end
    #@page_count = reader.page_count
  end
  haml :'books/index'
end

#__END__

#@@ layout

