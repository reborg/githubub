# http://github.com/account/applications
# http://gist.github.com/419219 GitHub OAuth Busy Developer's Guide
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, '9f2349465f43422a8696', 'efb1b55577a899c59cd46ef73d543e58219b4384'
end
