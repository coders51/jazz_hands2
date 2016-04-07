# JazzHands2

JazzHands2 aims to be the successor of the abandoned JazzHands (https://github.com/nixme/jazz_hands)

The dependencies has been updated, this only supports Ruby 2+.

Some of the codes comes from the new JazzHands (https://github.com/billywatson/jazz_hands) gem, but without
some conflict in names.

List of gems included:

* [**Pry**][pry] for a powerful shell alternative to IRB.
* [**Hirb**][hirb] for tabular collection output.
* [**Pry Rails**][pry-rails] for additional commands (`show-routes`,
  `show-models`, `show-middleware`) in the Rails console.
* [**Pry Doc**][pry-doc] to browse Ruby source, including C, directly from the
  console.
* [**Pry Git**][pry-git] to teach the console about git. Diffs, blames, and
  commits on methods and classes, not just files.
* [**Pry Remote**][pry-remote] to connect remotely to a Pry console.
* [**Pry Debugger**][pry-debugger] to turn the console into a simple debugger.
* [**Pry Stack Explorer**][pry-stack_explorer] to navigate the call stack and
  frames.

## Usage

Ruby 2+, Rails 3, 4 only.

Add this line to your application's Gemfile:

```ruby
group :development, :test do # well, this can be useful in production too...
  gem 'jazz_hands2'
end
```

And then execute:

    $ bundle

From now on, firing up a `rails console` will require all the gems above and turns on `Hirb`. You can disable `Hirb`
if you want with a `Hirb.disable`.

In my experience is much better to turn off it a couple of times instead of needing to turn on it all the times except a couple.

**Note:** even if [**AwesomePrint**] is a wonderful gem, due some existing bugs it is not included.
[eoinkelly](https://github.com/eoinkelly/awesome_print) forks seems to work fine and solve a lot of issues
while we wait for AwesomePrint v2, from the readme:

> **NOTE:** awesome_print v1.2.0 is the last release supporting Ruby versions prior to v1.9.3 and Rails versions prior to v3.0. The upcoming awesome_print v2.0 will require Ruby v1.9.3 or later and Rails v3.0 or later.

So if you are an AwesomePrint addicted, add this to your gemfile:

```ruby
group :development, :test do # well, this can be useful in production too...
  gem 'jazz_hands2'
  gem 'awesome_print', github: 'eoinkelly/awesome_print'
end
```

**Don't** call `AwesomePrint.pry!`, the `railtie.rb` automatically uses AwesomePrint if present.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/jazz_hands2/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request


[pry]:                http://pry.github.com
[awesome_print]:      https://github.com/michaeldv/awesome_print
[hirb]:               https://github.com/cldwalker/hirb
[pry-rails]:          https://github.com/rweng/pry-rails
[pry-doc]:            https://github.com/pry/pry-doc
[pry-git]:            https://github.com/pry/pry-git
[pry-debugger]:       https://github.com/nixme/pry-debugger
[pry-remote]:         https://github.com/Mon-Ouie/pry-remote
[pry-stack_explorer]: https://github.com/pry/pry-stack_explorer
