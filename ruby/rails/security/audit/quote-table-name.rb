def bad1()
  # ruleid: quote-table-name
  quote_table_name(params[:table])
end

def bad2()
  table = params[:table]
  # ruleid: quote-table-name
  quote_table_name(table)
end

def ok1()
  # ok: quote-table-name
  quote_table_name("name")
end

def ok2()
  table = "table"
  # ok: quote-table-name
  quote_table_name(table)
end
