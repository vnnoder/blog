class Post < ActiveRecord::Base
  has_many :comment		
	
	def tag_removed_content
		self.content.gsub(/<\/?[^\/<>]*>/," ").gsub(/&[a-zA-Z]*;/," ")
		
	end
end
