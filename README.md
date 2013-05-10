# Wisper Async (Experimental)

Extends [Wisper](https://github.com/krisleech/wisper) with async broadcasting
of events.

## Installation

```ruby
gem 'wisper-async'
```

## Usage

By passing `async` option when adding listeners any events broadcast to that
listener will happen in its own thread.

```ruby
my_publisher.add_subscriber(MySubscriber.new, :async => true)
```

This leans on Celluloid.

The listener is transparently turned in to a Celluloid Actor.

Please refer to [Celluloid](https://github.com/celluloid/celluloid/wiki)
for more information, particually the
[Gotchas](https://github.com/celluloid/celluloid/wiki/Gotchas).

## Compatibility

Tested with 1.9.x on MRI, JRuby and Rubinius.
See the [build status](https://travis-ci.org/krisleech/wisper-async) for details.

## License

Copyright (c) 2013 Kris Leech

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
