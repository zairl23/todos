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
  # @filename = File.expand_path(File.dirname(__FILE__)) + "/../stylesheets/O'Reilly.HTML5.Up.and.Running.pdf"
  # 选定pdf文件
  @filename = "/home/ney/todos/stylesheets/hello.pdf"
  # 读取文件内容
  PDF::Reader.open(@filename) do |reader|
    # 读取基本信息
    @info = reader.info.inspect
    @metadata = reader.metadata.inspect
    @version = reader.pdf_version
    # 读取文本信息
    @pages_text = []
    @page_counts = reader.page_count
    if @page_counts == 1
      @pages_text = reader.page(1)
    else
      (1..@page_counts).each do |i|
        @pages_text << reader.page(i).text 
      end
    end
  end
  haml :'books/index'
end

#__END__

#@@ layout

