# Einfug

## Description
Einfug is a library for transforming files into a pastie-friendly piece of text.

## Installation
    $ sudo gem install einfug

## Usage
    $ einfug [options] files|directories

### Options
#### -r, --recursive
Pastifies all files in a directory recursively.
Having `example_dir/foo.rb` and `example_dir/deeper_dir/bar.rb`, `$ einfug -r example_dir/` would pastify `foo.rb` and `bar.rb`.

#### -f, --full
Sets the full absolute filepath as section title instead of the single filename.

Without -f:

    $ einfug /home/tobias/example.rb
    ## example.rb
    ...

With -f:

    $ einfug -f /home/tobias/example.rb
    ## /home/tobias/example.rb
    ...

## Examples

    $ einfug example.rb
    $ einfug example_dir/
    $ einfug example.rb example_dir/
    $ einfug -r example_dir/
    $ einfug -r example.rb example_dir/
    $ einfug -f example.rb

## License
Copyright (c) 2010 Tobias Bühlmann

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

