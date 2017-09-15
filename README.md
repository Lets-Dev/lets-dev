# Let's Dev !

## Getting started

- Install [MailDev](http://danfarrelly.nyc/MailDev/) in development
    - `maildev` to start it
- Install [ImageMagick](https://github.com/thoughtbot/paperclip#image-processor)
- Copy `.env.example` into `.env`
- Run `bundle install`
- Set database:
    - Create user `letsdev` on your PostgreSQL server
        - On MacOS: `createuser letsdev -s`
    - Create `development` and `test` databases
        - On MacOS: 
            - `createdb -Oletsdev -Eutf8 letsdev_development`
            - `createdb -Oletsdev -Eutf8 letsdev_test`
    - `rake db:migrate`
    - `rake db:seed` if you want some fake datas
    
## Contributing

:+1::tada: First of all, thanks for contributing (or at least trying) :tada::+1:

We're working with [Git Flow](https://danielkummer.github.io/git-flow-cheatsheet/).

- Attribute yourself some [issues](https://github.com/Lets-Dev/lets-dev/issues) (it's better if you take a look at [projects](https://github.com/Lets-Dev/lets-dev/projects) to see what are our real priorities)
- Create your feature
- Develop your stuff
- Commit your changes with the #issue_id 
- Once it's done, create a [pull-request](https://github.com/Lets-Dev/lets-dev/pulls) to `develop`

## License

MIT License

Copyright (c) 2017 Let's Dev !

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
