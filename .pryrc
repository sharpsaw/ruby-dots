# vim:ft=ruby

# Workaround to fix invisible prompting. TODO: verify & upstream into pry
STDOUT.echo = true if STDOUT.respond_to? :echo=

if RUBY_VERSION[/^1.8/]
  def Readline.point; end # Fix for pry-editline incompatibility
  def Readline.set_screen_size *args; end # Fix for auto_resize!
  Pry.plugins['docmore'].disable!
end

if Pry.respond_to? :auto_resize!
  Pry.auto_resize!
else
  warn 'Non-new pry: patching WINCH manually.'
  trap :WINCH do
    size = `stty size`.split(/\s+/).map &:to_i
    Readline.set_screen_size *size
    Readline.refresh_line
  end
end

Pry.config.theme = 'vim-detailed'
#Pry.config.exception_handler = proc { |_, ex, _pry_| _pry_.run_command "enter-exception" } 

# TODO work with this
# http://www.igvita.com/2008/12/11/ruby-ast-for-fun-and-profit/
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
