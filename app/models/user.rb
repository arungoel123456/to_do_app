class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         has_many :reminds


         def get_all_tasks
         	remind_ids = self.reminds.all.pluck(:id)

		    return remind_ids

         end

         def get_all_not_done_tasks
         	remind_ids=self.get_all_tasks
         	all_not_done_tasks
         	remind_ids.each do |f|
         		r=Remind.find(f)
         		if(r.status==false)
         			all_not_done_tasks<<f
         		end
         	end

         	return all_not_done_tasks
         end




end
