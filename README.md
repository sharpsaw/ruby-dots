ruby-dots
========

Not much yet - more of a place to put Ruby-related stuffs.

More to come.

Context
-------

Why "-dots"?  See the system I start with:

  curl sharpsaw.org/init | sh

Scripts
-------

<!--
Requires: https://github.com/sharpsaw/perl-dots (for its bin/bin-docs)
Update by having sharpsaw/perl-dots then yy@" on the next line:
jjV}k!bin-docs
-->
* `,bhaml` ⇒ Browse HAML — uses sane-dots/bin/,b to open the output from `haml`
* `,gem` ⇒ "gem", but backgrounds docs generation for much speed.
* `,gemi` ⇒ `if [[ $# == 0 || '.' == "$1" ]]; then`
* `,gems` ⇒ `gem search -dr "$@"`
* `,gemu` ⇒ `,gem uninstall "$@"`
* `,rbenvi` ⇒ Install rbenv
* `be` ⇒ `bundle exec "$@"`
* `bui` ⇒ `if ! type bundle >/dev/null 2>&1; then`
* `buo` ⇒ Edit the gem given as an arg.
* `buu` ⇒ `bundle update "$@"`
* `cd-gem` ⇒ Spawn a shell in the dir of a gem. (Note: Requires a very recent pry)
* `gem.` ⇒ Install the current dir as a gem
* `gemdoc` ⇒ Run `gem server` then open a browser on localhost (using sane-dots/bin/,b)
* `viGemfile` ⇒ Analogous to 'visudo' — edit a Gemfile then run 'bundle install'

Contact
-------

rking-ruby-dots@sharpsaw.org

Ask/tell/demand anything. I'll be receptive.
