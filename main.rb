require_relative "lib/thing"
require_relative "lib/thing_collection"

path_for_data = __dir__ + "/data"
my_cupboard = ThingCollection.new(path_for_data)

puts "Сколько градусов за окном? (можно с минусом)"
user_input = STDIN.gets.to_i

if my_cupboard.generate(user_input).empty?
  puts "В гардеробе ни чего не найдено."
else
  puts "Формируем гардероб на день..."
  sleep(2)
  puts
  puts "Предлагаем сегодня надеть:"
  puts
  puts my_cupboard.generate(user_input)
end
