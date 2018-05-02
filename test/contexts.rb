require './test/sets/films'
require './test/sets/users'
require './test/sets/tags'

module Contexts
    include Contexts::Films
    include Contexts::Users
    include Contexts::Tags
end
