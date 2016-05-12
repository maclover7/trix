# Trix

[![Build Status](https://travis-ci.org/maclover7/trix.svg)](https://travis-ci.org/maclover7/trix)

Want to include Basecamp's awesome [Trix WYSIWYG
editor](http://trix-editor.org) in your Ruby on Rails application?
You've come to the right place!

Please see the appropriate guide for your environment of choice:

* [Ruby on Rails](#a-ruby-on-rails).

### a. Ruby on Rails

`trix` is easy to drop into Rails with the asset pipeline.

In your Gemfile you need to add the `trix` gem.

```ruby
gem 'trix'
```

`bundle install` and restart your server to make the files available through the pipeline.

Import Trix styles in `app/assets/stylesheets/application.css`:

```css
*= require trix
```

Require Trix Javascript magic in `app/assets/javascripts/application.js`:

```js
//= require trix
```

Finally, any place where you would like to use the Trix editor in your
forms, just use the `trix_editor` helper:

```ruby
f.trix_editor :body
```

Or if you are using the [formtastic](https://github.com/justinfrench/formtastic) gem:

```ruby
f.input :body, as: :trix_editor
```


## Trix

For the official Trix Github repository, go
[here](https://github.com/basecamp/trix).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/maclover7/trix.

## Upgrading Trix
1. Copy and paste Trix's `trix.js `to `vendor/assets/javascripts/trix.js`
2. Copy and paste Trix's `trix.css `to `vendor/assets/stylesheets/trix.css`
3. Update `lib/trix/version.rb` with the correct version number
4. `git commit -am 'Bump to vVERSION'`
4. `bundle exec rake release`

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
