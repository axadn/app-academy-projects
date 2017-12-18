require 'json'

class Flash
  def initialize(req, opts = {now: false})
    if opts[:store]
      @store = opts[:store]
    else
      @store = req.cookies['_rails_lite_app_flash']
      if @store
        @store = JSON.parse(@store)
      else
        @store = {}
      end
    end
    @now = opts[:now]
    @should_save_key = {}
  end

  def [](key)
    @store[key.to_s]
  end

  def []=(key, val)

    @store[key.to_s] = val
    @should_save_key[key] = @now ? false : true
  end

  def store_flash(res)
    @store.keys.each do |key|
      @store.delete(key) unless @should_save_key[key]
    end
    res.set_cookie('_rails_lite_app_flash',
      {path: "/", value: @store.to_json})
  end

  def now
    Flash.new(nil, store: @store, now: true)
  end

end
