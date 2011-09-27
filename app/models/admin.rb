class Admin < ActiveRecord::Base
	
	def self.encrypt(pass, salt)
	   Digest::SHA1.hexdigest(pass+salt)
 	end
 	
 	def self.random_string(len)
	   #generate a random password consisting of strings and digits
	   chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
	   str = ""
	   1.upto(len) { |i| str << chars[rand(chars.size-1)] }
	   return str
 	end
end
