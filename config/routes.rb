Rails.application.routes.draw do
	namespace :blueprint do
  		get '/:model_name' => 'model#get_schema'
  	end

  	get '/test' => 'aplication#get_schema'
end