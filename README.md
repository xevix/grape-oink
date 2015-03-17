## Overview

The grape-oink gem provides a way to use the [Oink](https://github.com/noahd1/oink) library with [Grape](https://github.com/intridea/grape).

## Requirements

* Grape >= 0.10.0

## Usage

### Build and Install

To use, just install the gem from RubyGems or via Bundler by requiring it in your Gemfile.

```
gem 'grape-oink'
```

### Middleware Setup

In your Grape API, install the middleware which will translate Grape endpoints to what Oink expects.

```ruby
use Grape::Middleware::OinkMiddleware
```

Set up the Oink middleware. The below example is in `config.ru` of a generic Rack project.

```ruby
require 'oink'
oink_path = File.expand_path('../log/oink.log', __FILE__)
use Oink::Middleware, :logger => Hodel3000CompliantLogger.new(oink_path)
```

## Endpoint translation

Oink expects Rails-style endpoints where there is a `controller` and an `action`. Grape is more flexible
than Oink in what these can be, so a few translation rules were added to make Oink happy.

The controller name might be namespaced. In this case, only the last class will be used in snakecase. This may change later.

```
My::Name::Space::UserObjects --> 'user_objects'
```

Certain tokens in the `action` are replaced.

Token | Replacement
----- | -----------
 ':'  |    'col_'
 '/'  |    'sl_'

An example of a translation would be:

```
/:id --> sl_col_id
```

## TODO

* Include endpoint method in the action name. Oink doesn't seem to support method out of the box.
