module ModelSupport
  extend ActiveSupport::Concern

  require 'digest/md5'

  included do
    self.primary_key = :id
    before_create :hash_id
  end

  def hash_id
    random_string = ('a'..'z').to_a.shuffle[0,8].join
    self.id = Digest::MD5.hexdigest(DateTime.now.to_s + random_string)
  end

end