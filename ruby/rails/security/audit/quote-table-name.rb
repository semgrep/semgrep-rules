def bad1()
  quote_table_name(params[:table])
end

def bad2()
  table = params[:table]
  quote_table_name(table)
end

def ok1()
  quote_table_name("name")
end

def ok2()
  table = "table"
  quote_table_name(table)
end
