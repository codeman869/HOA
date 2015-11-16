class Unit < ActiveRecord::Base
    belongs_to :user
    before_save :remove_dependent_relations
    
    private
    
    def remove_dependent_relations
        if user_id != 0
            Unit.where("user_id = #{user_id}").each do |x|
               x.user_id = 0
               x.save
            end
        end
    end
end
