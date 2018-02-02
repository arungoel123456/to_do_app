class UserMailer < ApplicationMailer

	def new_remind_email(remind_id)

		@remind = Comment.find(remind_id)
		mail(
				to: @remind.user.email,
				subject: 'New remind'

				# cc: [email1, email2]
			)

	end
end
