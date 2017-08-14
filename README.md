<p align=center>
  <a href=https://goo.gl/BhrgjW>
    <img src=https://envygeeks.io/badges/paypal-large_1.png alt=Donate>
  </a>
  <br>
  <a href=https://travis-ci.org/envygeeks/jekyll-log-wrapper>
    <img src="https://travis-ci.org/envygeeks/jekyll-log-wrapper.svg?branch=master">
  </a>
</div>

# Jekyll LogWrapper

Jekyll LogWrapper provides a logging interface to bring the logging interfaces of Jekyll onto par with Ruby stdlib, so that you can use the logging interface of Jekyll with things like ActiveSupport, Sprockets and other pure Ruby systems that depend on similar interfaces between all loggers.  ***This is not a logging facility, you must use Jekyll's logger for our logging interface.***

## Usage

```ruby
require "active_support/cache"
wrapper = Jekyll::LogWrapper.new(Jekyll.logger)
cache = ActiveSupport::Cache::FileStore.new(".jekyll-cache")
cache.logger = wrapper
```
