# DoubleDispatch

Allows the creation of different implementations of the same method based on the class of the method arguments,
similar to overloading in Java.
Unlike other implementations of the same pattern, this one doesn't overload the Object class.


## Quick Start

Using Gemfile:

```
# Gemfile
...
gem 'double_dispatch'
...

$ bundle install
```


```ruby
require 'double_dispatch'

# The visitable animals
Animal = Struct.new(:name)
Lion = Class.new(Animal)
Meerkat = Class.new(Animal)

class Visitor
  include DoubleDispatch::Dispatchable

  double_dispatch :visit, Animal do |animal|
    "An animal."
  end

  double_dispatch :visit, Lion do |animal|
    "A lion."
  end
end

visitor = Visitor.new

visitor.visit Lion.new('Simba')
# => "An animal."

visitor.visit Meerkat.new('Timon')
# => "An animal."
```

Inheritance can be used to create more specific visitor.
You can create subclasses of your Visitor which will try to match their own methods first
and delegate to the parent class when none found.


## Contributing

Do not forget to run the tests with:

```bash
bundle exec rake
```

And bump the version with any of:

```bash
$ gem bump --version 1.1.1       # Bump the gem version to the given version number
$ gem bump --version major       # Bump the gem version to the next major level (e.g. 0.0.1 to 1.0.0)
$ gem bump --version minor       # Bump the gem version to the next minor level (e.g. 0.0.1 to 0.1.0)
$ gem bump --version patch       # Bump the gem version to the next patch level (e.g. 0.0.1 to 0.0.2)
```

