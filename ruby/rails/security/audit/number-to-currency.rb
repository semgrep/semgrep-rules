def bad1()
  # ruleid: number-to-currency
  number_to_currency(1.02, unit: params[:currency])
end

def bad2()
  currency = params[:currency]
  currency = currency + "unit"
  # ruleid: number-to-currency
  number_to_currency(1.02, unit: currency)
end

def ok1()
  # ok: number-to-currency
  number_to_currency(1.03, unit: h(params[:currency]))
end

def ok2()
  number_to_currency(1234567890.50, unit: "R$", separator: ",", delimiter: "")
end
