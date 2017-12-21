require 'stock_quote'
require 'eu_central_bank'

@bank = EuCentralBank.new

def usd_to_krw(volume)
  @bank.update_rates
  rate = @bank.exchange(100, 'USD', 'KRW').to_f
  return result = (volume.to_f * rate).round(1)
end
# DATA 아래에 써있는 데이타로 인식
DATA.each do |company|
  company.chomp!
  stock = StockQuote::Stock.quote(company)
  puts "#{stock.name}의 가격은"
  puts "$ #{stock.l}는 #{usd_to_krw(stock.l)}원"
  # p company
end

#루비 코드가 끝났따고 인식함
__END__
AAPL
FB
TSLA
GOOGL
AMZN
