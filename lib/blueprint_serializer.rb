require 'blueprint_serializer/engine'

module BlueprintSerializer
	begin
		Rails.application.reload_routes!
	end
end
