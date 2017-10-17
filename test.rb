 name = ARGV[0]

if name == nil
  puts "Как Вас зовут (в латинице)?"
  name = STDIN.gets.chomp
end

puts "Здравствуйте #{name}! Вашему вниманию предлагается несколько простых вопросов." \
    " Отвечайте быстро, однозначно: «да», «нет», «иногда»."
puts

current_path = File.dirname(__FILE__)
questions_path = current_path + "/data/questions.txt"
answers_path = current_path + "/data/answers.txt"

unless File.exist?(questions_path) && File.exist?(answers_path)
  abort "File didn't find"
end

questions_file = File.new(questions_path, "r:UTF-8")
questions = questions_file.readlines
questions_file.close

answers_file = File.new(answers_path, "r:UTF-8")
answers = answers_file.readlines
answers_file.close



all_answer = []
for item in questions do
  puts  item
  user_ans = nil
  until user_ans == 'y' || user_ans == 'n' || user_ans == 's'
    puts "Ваш ответ: y - «да», n - «нет», s - «иногда»"
    user_ans = STDIN.gets.chomp.downcase
  end
  all_answer << user_ans
end

sum_answers = 2*all_answer.count("y") + all_answer.count("s")
puts "\n#{name}"
puts "Вы набрали #{sum_answers} баллов"

if sum_answers >= 30
  puts answers[0]
elsif sum_answers >= 25
  puts answers[1]
elsif sum_answers >= 19
  puts answers[2]
elsif sum_answers >= 14
  puts answers[3]
elsif sum_answers >= 9
  puts answers[4]
elsif sum_answers >= 4
  puts answers[5]
else
  puts answers[6]
end
