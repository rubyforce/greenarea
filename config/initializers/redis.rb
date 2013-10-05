redis_uri = URI.parse(Rails.configuration.redis.url)

$redis = Redis.new(:host => redis_uri.host,
                   :port => redis_uri.port,
                   :password => redis_uri.password,
                   :thread_safe => true)

