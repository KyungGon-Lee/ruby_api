require 'open-uri'
require 'json' # 자바스크립트에 잇는 해시


url = 'http://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo='

page = open(url).read

info = JSON.parse(page)
# 1 현재 info hash에 있는 값을 잘해서 아래에 넣는다.
lucky_numbers = []
info.each do |key, value|
  lucky_numbers << value if key.include?('drwtNo')
end
lucky_numbers.sort!
bonus_number = info['bnusNo']
# 2.우리가 뽑은 번호와 비교
my_numbers = [*1..45].sample 6
# *는 배열로 만들겠다는 뜻
result = 0

6.times do |i|
  6.times do |j|
  if lucky_numbers[i-1] == my_numbers[j-1]
    result += 1
  end
end
end
# puts result
# puts '1개 맞춤' if result == 1
# puts '2개 맞춤' if result == 2
# puts '3개 맞춤' if result == 3
# puts '4개 맞춤 5등이당' if result == 4
# puts '5개 맞춤 3등이당' if result == 5
# puts '5개 맞추고 보너스 2등임' if result == 5 && my_numbers.include? bonus_number
# puts '6개 맞춤 1등임' if result == 6
p my_numbers
p lucky_numbers
p result

text =
        case[result, my_numbers.include?(bonus_number)]
          when[6, false] then '1등'
          when[5, true] then '2등'
          when[5, false] then '3등'
          when[4, false] then '4등'
          when[3, false] then '5등'
          else '꽝!'
        end
puts text
