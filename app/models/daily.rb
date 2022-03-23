class Daily < ApplicationRecord
    attr_accessor :message
    def instantiate
        @date = Time.today
        @message = nil
    end
end
