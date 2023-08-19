require_relative 'app'

app = App.new

loop do
  print ' Select an option: '
  app.display_options
  option = gets.chomp.to_i
  result = app.process_choice(option)
  break if result == 'exit'
end
