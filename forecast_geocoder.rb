require "forecast_io"
require "geocoder"

ForecastIO.configure do |configuration|
  configuration.api_key = '32aa4aa494711fc39d0175bad81fac41'
end

def f_to_c(f)
  f = f.to_f
 ((f - 32) * 5 / 9).round(2) # 마지막값이라 리턴댐
end

print '어디가 궁금하세영? : '
input = gets.chomp
loCord = Geocoder.coordinates(input)

forecast = ForecastIO.forecast(loCord.first, loCord.last)
f = forecast.currently
puts "#{input}의 위도경도는#{loCord}"
puts "현재 날씨는 #{f.summary}"
puts "현재 온도는 #{f_to_c f.temperature} 도 입니다"
#시크릿 키
