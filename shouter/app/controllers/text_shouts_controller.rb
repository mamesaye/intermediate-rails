class TextShoutsController < ApplicationController
	def create
		content = build_content
		# same as #shout = current_user.shouts.build({ :content => content}) 
		shout = current_user.shouts.build(content: content)
		if shout.save
			redirect_to dashboard_path
		else
			flash.alert = 'Could not shout! it is empty!'
			redirect_to dashboard_path
		end
	end

	private

	def build_content
		TextShout.new(text_shout_parameters)
	end

	def text_shout_parameters
		params.require(:text_shout).permit(:body)
	end
end