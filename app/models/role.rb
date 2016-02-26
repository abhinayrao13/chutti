class Role <  ActiveRecord::Base
  has_many :users

  def self.get_role_ids
    @roles = self.all
    @result = []
    @roles.each do |r|
      @result << r.id
    end
    return @result
  end
end
