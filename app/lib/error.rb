class Error
  attr_reader :message, :code, :info

  def initialize(message:, code:, info: nil)
    @message = message
    @code = code
    @info = info
  end

  def as_json
    {
      message: message,
      code: code,
      info: info
    }
  end

  class << self
    def record_not_found(model, column, value)
      new(
        message: 'RECORD_NOT_FOUND',
        code: 1001,
        info: { model: model, column: column, value: value }
      )
    end

    def record_invalid(errors)
      new(
        message: 'RECORD_INVALID',
        code: 1002,
        info: errors
      )
    end

    def unauthorized(path = '')
      new(
        message: 'UNAUTHORIZED',
        code: 1003,
        info: {
          path: path
        }
      )
    end
  end
end
