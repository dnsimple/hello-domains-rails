class User < ApplicationRecord
  self.inheritance_column = nil

  def self.find_or_create_by_uid(uid, data)
    user = by_uid(uid)

    unless user.nil?
      refresh_token(uid, data)
      return user
    end

    create(data.to_h)
  end

  def self.by_id(id)
    where(id: id).first
  end

  def self.by_uid(uid)
    where(uid: uid).first
  end

  def self.refresh_token(uid, data)
    where(uid: uid).update(token: data[:token])
  end
end
