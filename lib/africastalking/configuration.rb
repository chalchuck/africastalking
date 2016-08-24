module Africastalking
	class Configuration
		attr_accessor :username, :apikey

		def initialize(params={})
			@user ||= params.dig(:username)
			@pass ||= params.dig(:apikey)
		end

		def header
		  {
				username: username,
				apikey: apikey,
				"apikey" => apikey,
				'Accept' => 'application/json',
				'Content-Type'=> 'application/json'
			}
		end
	end
end
