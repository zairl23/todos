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
 
  #@filename = File.expand_path(File.dirname(__FILE__)) + "/../stylesheets/O'Reilly.HTML5.Up.and.Running.pdf"
  #@filename = "/home/ney/todos/stylesheets/O'Reilly.HTML5.Up.and.Running.pdf"
  @filename = "/home/ney/todos/stylesheets/CannonDoloresLegendofStarcrash.pdf"
  PDF::Reader.open(@filename) do |reader|
    @info = reader.info.inspect
    @metadata = reader.metadata.inspect
    @pages_text = []
    #reader.pages.each do |page| 
     # @pages_text << page.text
    #end
    @page_counts = reader.page_count
    (1..@page_counts).each do |i|
      @page = reader.page(i)
      @receiver = PDF::Reader::PageTextReceiver.new
      @page.walk(@receiver)
      @pages_text[i] = @receiver.content
    end
    #@pages_text = reader.page(3).text

    @version = reader.pdf_version
    #@obj = reader.objects[3]
  end
  haml :'books/index'
end

#__END__

#@@ layout

