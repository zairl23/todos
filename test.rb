require "pdf-reader"

#@filename = "/home/ney/todos/stylesheets/O'Reilly.HTML5.Up.and.Running.pdf"
#@filename = "/home/ney/todos/stylesheets/helloworld.pdf"
#@filename = "/home/ney/todos/stylesheets/Law_Of_Squares_Part1.pdf"
PDF::Reader.open(@filename) do |reader|
  @pages_text = reader.page(1).text
end  
puts @pages_text
