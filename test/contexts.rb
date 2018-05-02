require './test/sets/films'
require './test/sets/users'

module Contexts
    include Contexts::Films
    include Contexts::Users
end
