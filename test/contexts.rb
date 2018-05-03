require './test/sets/films'
require './test/sets/users'
require './test/sets/tags'
require './test/sets/users'

module Contexts
    include Contexts::Films
    include Contexts::Users
    include Contexts::Tags
    include Contexts::Users
end
