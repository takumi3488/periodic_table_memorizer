require 'csv'
require './get_data'

# yかnを入力値として受け取る
def is_input_default(output, non_default='y')
  print output
  gets.strip.downcase != non_default
end

get_data unless File.exists?('data.csv') && is_input_default('targets.txtを再読み込みしますか？(yN): ')

data = CSV.read('data.csv', headers: true).map(&:to_hash)

correct = data.count { |row| row['correct'] == 'o' }
puts "#{data.size}問中#{correct}問暗記済み"

loop do
  unless is_input_default '解答履歴を削除しますか?(yN): '
    File.open('data.csv', 'w') do |f|
      f.puts 'number,symbol,japanese,correct'
      data.each do |row|
        f.puts "#{row['number']},#{row['symbol']},#{row['japanese']},x"
      end
    end
    data = CSV.read('data.csv', headers: true).map(&:to_hash)
    correct = data.count { |row| row['correct'] == 'o' }
  end

  puts ''
  puts "開始(全#{data.size-correct}問)"
  puts ''

  data.each do |row|
    next if row['correct'] == 'o'

    num = row['number']
    sym = row['symbol'].downcase
    ja = row['japanese']
    print "原子番号#{num}: "
    input = gets.strip.downcase

    if sym == input
      puts '正解!'
      data.map! do |new_row|
        new_row['correct'] = 'o' if new_row['number'] == num
        new_row
      end
      File.open('data.csv', 'w') do |f|
        f.puts 'number,symbol,japanese,correct'
        data.each do |new_row|
          f.puts "#{new_row['number']},#{new_row['symbol']},#{new_row['japanese']},#{new_row['correct']}"
        end
      end
    else
      puts '不正解!'
      puts "正解は#{sym.capitalize}(#{ja})"
    end
    puts ''
  end

  correct = data.count { |row| row['correct'] == 'o' }
  puts "#{data.size}問中#{correct}問暗記済み"
  break unless is_input_default('もう一度解答しますか？(Yn): ', 'n')
end

puts '終了'
