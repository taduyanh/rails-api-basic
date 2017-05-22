module ApiError
  class Base < StandardError
    def initialize class_name = nil
      class_name = self.class.name unless class_name
      @code = class_name.underscore.gsub(%r{\/}, ".")
      @code_number = Settings.error_formatter.error_codes[@code.split(".").last]
      @message = I18n.t(@code)
    end

    def to_hash
      {
        Settings.error_formatter.error_code_key => @code_number,
        Settings.error_formatter.message_key => @message
      }
    end
  end

  class Unauthenticated < Base
  end

  class Unauthorized < Base
  end

  class TokenExpired < Base
  end
end
