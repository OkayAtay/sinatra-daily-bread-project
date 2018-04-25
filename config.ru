require './config/environment'

use Rack::MethodOverride
use ChefController
use RecipeController
run ApplicationController
