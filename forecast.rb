require "forecast_io"


"32aa4aa494711fc39d0175bad81fac41"

ForecastIO.configure do |configuration|
  configuration.api_key = '32aa4aa494711fc39d0175bad81fac41'
end

forecast = ForecastIO.forecast(37.501451, 127.039606)
f = forecast.currently

def f_to_c(f)
  f = f.to_f
 ((f - 32) * 5 / 9).round(2) # 마지막값이라 리턴댐
end


puts "현재 날씨는 #{f.summary}"
puts "현재 온도는 #{f_to_c f.temperature} 도 입니다"
#시크릿 키
