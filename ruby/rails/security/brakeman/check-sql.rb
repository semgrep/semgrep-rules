class Product < ActiveRecord::Base
  def test_find_order
    #ruleid: check-sql
    Product.find(:all, :order => params[:order])
    #ruleid: check-sql
    Product.find(:all, :conditions => 'admin = 1', :order => "name #{params[:order]}")
  end

  def test_find_group
    #ruleid: check-sql
    Product.find(:all, :conditions => 'admin = 1', :group => params[:group])
    #ruleid: check-sql
    Product.find(:all, :conditions => 'admin = 1', :group => "something, #{params[:group]}")
  end

  def test_find_having
    #ruleid: check-sql
    Product.find(:first, :conditions => 'admin = 1', :having => "x = #{params[:having]}")

    #ok: check-sql
    Product.find(:first, :conditions => 'admin = 1', :having => { :x => params[:having]})

    #ok: check-sql
    Product.find(:first, :conditions => ['name = ?', params[:name]], :having => [ 'x = ?', params[:having]])

    #ruleid: check-sql
    Product.find(:first, :conditions => ['name = ?', params[:name]], :having => [ "admin = ? and x = #{params[:having]}", cookies[:admin]])
    #ruleid: check-sql
    Product.find(:first, :conditions => ['name = ?', params[:name]], :having => [ "admin = ? and x = '" + params[:having] + "'", cookies[:admin]])
  end

  def test_find_joins
    #ok: check-sql
    Product.find(:first, :conditions => 'admin = 1', :joins => "LEFT JOIN comments ON comments.post_id = id")

    #ruleid: check-sql
    Product.find(:first, :conditions => 'admin = 1', :joins => "LEFT JOIN comments ON comments.#{params[:join]} = id")

    #ok: check-sql
    Product.find(:first, :conditions => 'admin = 1', :joins => [:x, :y])

    #ruleid: check-sql
    Product.find(:first, :conditions => 'admin = 1', :joins => ["LEFT JOIN comments ON comments.#{params[:join]} = id", :x, :y])
  end

  def test_find_select
    #ok: check-sql
    Product.find(:last, :conditions => 'admin = 1', :select => "name")

    #ruleid: check-sql
    Product.find(:last, :conditions => 'admin = 1', :select => params[:column])
    #ruleid: check-sql
    Product.find(:last, :conditions => 'admin = 1', :select => "name, #{params[:column]}")
    #ruleid: check-sql
    Product.find(:last, :conditions => 'admin = 1', :select => "name, " + params[:column])
  end

  def test_find_from
    #ok: check-sql
    Product.find(:last, :conditions => 'admin = 1', :from => "users")

    #ruleid: check-sql
    Product.find(:last, :conditions => 'admin = 1', :from => params[:table])
    #ruleid: check-sql
    Product.find(:last, :conditions => 'admin = 1', :from => "#{params[:table]}")
  end

  def test_find_lock
    #ok: check-sql
    Product.find(:last, :conditions => 'admin = 1', :lock => true)

    #ruleid: check-sql
    Product.find(:last, :conditions => 'admin = 1', :lock => params[:lock])
    #ruleid: check-sql
    Product.find(:last, :conditions => 'admin = 1', :lock => "LOCK #{params[:lock]}")
  end

  def test_where
    #ok: check-sql
    Product.where("admin = 1")
    #ok: check-sql
    Product.where("admin = ?", params[:admin])
    #ok: check-sql
    Product.where(["admin = ?", params[:admin]])
    #ok: check-sql
    Product.where(["admin = :admin", { :admin => params[:admin] }])
    #ok: check-sql
    Product.where(:admin => params[:admin])
    #ok: check-sql
    Product.where(:admin => params[:admin], :some_param => params[:some_param])

    #ruleid: check-sql
    Product.where("admin = '#{params[:admin]}'").first
    #ruleid: check-sql
    Product.where(["admin = ? AND user_name = #{@name}", params[:admin]])
  end

  TOTALLY_SAFE = "some safe string"

  def test_constant_interpolation
    #ok: check-sql
    Product.first("blah = #{TOTALLY_SAFE}")
  end

  def test_local_interpolation
    #this is a weak finding and should be covered by a different rule
    #ok: check-sql
    Product.first("blah = #{local_var}")
  end

  def test_conditional_args_in_sql
    #ruleid: check-sql
    Product.last("blah = '#{something ? params[:blah] : TOTALLY_SAFE}'")

    #ok: check-sql
    Product.last("blah = '#{params[:blah] ? 1 : 0}'")
  
    #ruleid: check-sql
    Product.last("blah = '#{params[:blah] ? params[:blah] : 0}'")

    #ruleid: check-sql
    Product.last("blah = '#{params[:blah] ? 1 : params[:blah]}'")
  end

  def test_params_in_args
    #ruleid: check-sql
    Product.last("blah = '#{something(params[:blah])}'")
  end

  def test_params_to_i
    #ok: check-sql
    Product.last("blah = '#{params[:id].to_i}'")
  end

  def test_more_if_statements
    if some_condition
      x = params[:x]
    else
      x = "BLAH"
    end

    y = if some_other_condition
      params[:x]
      "blah"
    else
      params[:y]
      "blah"
    end

    #ruleid: check-sql
    Product.last("blah = '#{x}'")

    #ok: check-sql
    Product.last("blah = '#{y}'")
    #ok: check-sql
    Product.where("blah = 1").group(y)
  end

  def test_calculations
    #ruleid: check-sql
    Product.calculate(:count, :all, :conditions => "blah = '#{params[:blah]}'")
    #ruleid: check-sql
    Product.minimum(:price, :conditions => "blah = #{params[:blach]}")
    #ruleid: check-sql
    Product.maximum(:price, :group => params[:columns])
    #ruleid: check-sql
    Product.average(:price, :conditions => ["blah = #{params[:columns]} and x = ?", x])
    #ruleid: check-sql
    Product.sum(params[:columns])
  end

  def test_select
    #ok: check-sql
    Product.select([:price, :sku])

    #ruleid: check-sql
    Product.select params[:columns]
  end

  def test_conditional_in_options
    x = params[:x] == y ? "created_at ASC" : "created_at DESC"
    z = params[:y] == y ? "safe" : "totally safe"

    #ok: check-sql
    Product.all(:order => x, :having => z, :select => z, :from => z,
                :group => z)
  end

  def test_or_interpolation
    #ok: check-sql
    Product.where("blah = #{1 or 2}")
  end

  def test_params_to_f
    #ok: check-sql
    Product.last("blah = '#{params[:id].to_f}'")
  end

  def test_interpolation_in_first_arg
    #ruleid: check-sql
    Product.where("x = #{params[:x]} AND y = ?", y)
  end

  def test_to_sql_interpolation
    #ok: check-sql
    prices = Product.select(:price).where("created_at < :time").to_sql
    #ok: check-sql
    where("price IN (#{prices}) OR whatever", :price => some_price)
  end
end
