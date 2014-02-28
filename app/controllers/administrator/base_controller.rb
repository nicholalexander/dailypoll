class Administrator::BaseController < ApplicationController
	layout "layouts/administrator"
	before_filter :authorize_admin

end