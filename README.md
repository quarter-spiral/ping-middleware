# Ping::Middleware

Middleware that responds to simple keep alive pings

## Usage

Use ``Ping::Middleware`` as a Rack middleware. After that the middleware responds to any request coming in to the ``/__ping__`` path and responds with a HTTP 200 status code and a body which just reads: ``Pong``.

### Sinatra

```ruby
require "ping-middleware"
require "sinatra"

use Ping::Middleware

get '/' do
  "hello"
end
```

### Rails

```ruby
# config/application.rb

config.middleware.use Ping::Middleware
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
