# ValidatesGuatemalaIdentity

This projects aims to validate Guatemala Identity (Documento Personal de Identificación).
The Regex part of this project was based on [this page](https://learn.sayari.com/interpreting-guatemalan-national-id-numbers/) and the
state and city numbers on [this page](https://www.mineduc.gob.gt/DIGEESP/documents/adecuacionesCurriculares/Documentos%20de%20Apoyo/C%C3%B3digos%20Departamentos-Municipios-Idiomas.pdf)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'validates_guatemala_identity'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install validates_guatemala_identity

## Usage

Just use as any other validator:

```ruby
class User < ActiveRecord::Base
  validates :identity, guatemala_identity: true
end
```

## Testing

Require the matcher:

```ruby
require 'validates_guatemala_identity/require_a_valid_guatemala_identity_matcher'
```

Use in your tests:

```ruby
it { is_expected.to require_a_valid_guatemala_identity } # It will test the attribute :identity by default
it { is_expected.to require_a_valid_guatemala_identity(:id) } # It will test the attribute :id
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/plribeiro3000/validates_guatemala_identity. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/plribeiro3000/validates_guatemala_identity/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ValidatesGuatemalaIdentity project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/plribeiro3000/validates_guatemala_identity/blob/master/CODE_OF_CONDUCT.md).
