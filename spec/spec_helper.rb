require'bundler'
Bundler.require
require'pry'

RSpec.configure do |c|
  c.color = true
end

require 'double_dispatch'
include DoubleDispatch

