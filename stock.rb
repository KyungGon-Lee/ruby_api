require 'stock_quote'

# companies = ['AAPL', 'FB', 'TSLA', 'GOOGL', 'AMZN']

# DATA 아래에 써있는 데이타로 인식
DATA.each do |company|
  company.chomp!
  stock = StockQuote::Stock.quote(company)
  puts stock.name
  puts stock.l
  # p company
end
#루비 코드가 끝났따고 인식함
__END__
AAPL
FB
TSLA
GOOGL
AMZN
