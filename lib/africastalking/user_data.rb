module Africastalking
  class UserData < Connection
    class << self

      def retrieve
        get("/version1/user?username=#{Africastalking.config.username}")
      end
    end
  end
end
