require 'digest/md5'

module ShoutsHelper
	def gravatar user, size = 48
		digest = Digest::MD5.hexdigest(user.email)
		image_tag("http://gravatar.com/avatar/#{digest}?s=#{size}")
	end

	def shouterize text
		#get the text  and remove/strip the html and add link tag
		link_hashtags(strip_tags(text)).html_safe
	end

	private

	def link_hashtags(text)
		#substring
		#text.gsub(/#\w+/) { |match| link_to(match, hashtag_path(match))}
		#http://localhost:3000/hashtags/%23ruby

		#text.gsub(/#\w+/) { |match| link_to(match, hashtag_path(match[1..-1]))}
		#http://localhost:3000/hashtags/ruby

		#text.gsub(/#\w+/) { |match| link_to(match, hashtag_path(match.slice(1..-1)))}
		#http://localhost:3000/hashtags/ruby

		#capture grp/ global variable
		text.gsub(/#(\w+)/) { |match| link_to(match, hashtag_path($1))}
		#http://localhost:3000/hashtags/ruby
	end
end