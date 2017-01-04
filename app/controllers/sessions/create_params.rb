class CreateParams
  OMNIAUTH_AUTH = 'omniauth.auth'.freeze

  def initialize(env)
    uid   = env.dig(OMNIAUTH_AUTH, 'uid')
    info  = env.dig(OMNIAUTH_AUTH, 'info')
    token = env.dig(OMNIAUTH_AUTH, 'credentials', 'token')

    @params = info.merge('uid' => uid, 'token' => token)
    @params.delete('plan_identifier')
  end

  def [](key)
    params[key]
  end

  def to_h
    params.to_h
  end

  alias to_hash to_h

  private

  attr_reader :params
end
