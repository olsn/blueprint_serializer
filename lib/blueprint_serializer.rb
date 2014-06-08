require 'rails/routes'

module BlueprintSerializer
	begin
		Rails.application.reload_routes!
	end
end
