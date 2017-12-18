require 'json'

class Session
  # find the cookie for this app
  # deserialize the cookie into a hash
  def initialize(req)
    @store = req.cookies["_rails_lite_app"]
    if @store
      @store =JSON.parse(@store)
    else
      @store = {}
    end
  end

  def [](key)
    @store[key.to_s]
  end

  def []=(key, val)
    @store[key.to_s] = val
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res)
    res.set_cookie('_rails_lite_app',
      {path: "/", value: @store.to_json})
  end
end
