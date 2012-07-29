# vim:ft=ruby
Pry.config.theme = 'vim-detailed'

# Should be in pry-de
Pry.commands.command 'r' do run 'history --replay -1' end
Pry.commands.alias_command 'c', 'continue'
Pry.commands.alias_command 's', 'step'
Pry.commands.alias_command 'n', 'next'

# Follow pry-doc further, e.g.:
# $ [].push
# c 'rb_ary_modify'
def c m
# Depends on something like the following:
  # mkdir ~/pkg
  # git clone  https://github.com/ruby/ruby.git
  # cd ruby && ctags -R
  Dir.chdir ENV['HOME']+'/pkg/ruby' do
    system 'vim', '-t', m
  end
end

# TODO: Remember where these came from
def d c
  require 'parsetree'
  ParseTree.translate c
end
def s c
  require 'ruby4ruby'
  SexpProcessor.new.process d(c)
end

def hammit haml
  require 'haml'
  Haml::Engine.new(haml).render
end

# So you don't type a = [1,2,3] or h = { a: 1, b: 2 } so much.
class Array
  def self.toy(n=10, &block)
    block_given? ? Array.new(n,&block) : Array.new(n) {|i| i+1}
  end
end
class Hash
  def self.toy(n=10)
    Hash[Array.toy(n).zip(Array.toy(n){|c| (96+(c+1)).chr})]
  end
end
