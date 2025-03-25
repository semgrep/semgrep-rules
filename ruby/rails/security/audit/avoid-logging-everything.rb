# ruleid:avoid-logging-everything
Rails.logger.info(params)

# ruleid:avoid-logging-everything
Rails.logger.info(params.inspect)

# ruleid:avoid-logging-everything
Rails.logger.info "my private info :)! #{params}"

# ruleid:avoid-logging-everything
Rails.logger.info "my private info :)! #{params.inspect}"

# ruleid:avoid-logging-everything
Rails.logger.info do
  params
end

# ruleid:avoid-logging-everything
Rails.logger.info do
  params.inspect
end

# ruleid:avoid-logging-everything
Rails.logger.info do
  "my private info :)! #{params}"
end

# ruleid:avoid-logging-everything
Rails.logger.info do
  "my private info :)! #{params.inspect}"
end

# ruleid:avoid-logging-everything
Rails.logger.info do
  params
end

# ok:avoid-logging-everything
Rails.logger.info("some static string")

# ok:avoid-logging-everything
Rails.logger.info(something_that_isnt_params)

# ok:avoid-logging-everything
Rails.logger.info(params[:a_specific_parameter])

# ok:avoid-logging-everything
Rails.logger.info("#{params[:a_specific_parameter]}")

# ok:avoid-logging-everything
Rails.logger.info("not sensitive :( #{params[:a_specific_parameter]}")

# ok:avoid-logging-everything
Rails.logger.info do
  "#{not_params} #{still_not_params.inspect} #{params[:test]}"
end

# ok:avoid-logging-everything
Rails.logger.info do
  params[:test]
end

# ok:avoid-logging-everything
Rails.logger.debug("go wild #{params} #{params.inspect}")

# ok:avoid-logging-everything
Rails.logger.debug(params)

# ok:avoid-logging-everything
Rails.logger.debug do 
  params
end

# ok:avoid-logging-everything
Rails.logger.debug do 
  params.inspect
end
