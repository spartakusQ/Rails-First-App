# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGuru" <mail@test.guru.com>}
  layout 'mailer'
end
