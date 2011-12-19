require "prawn"
img = "/home/ney/todos/images/bg.jpg"

Prawn::Document.generate("background.pdf", :background => img, :margin => 100) do
  text "My report caption", :size => 18, :align => :right
  move_down font.height * 2
  text "Here is my text explaning this report. " * 20, :size => 12, :align => :left, :leading => 2
  move_down font.height
  text "I'm using a soft background. " * 40, :size => 12, :align => :left, :leading => 2
end

