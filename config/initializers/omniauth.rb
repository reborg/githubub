# http://github.com/account/applications
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, '5bf6b424630f100fd803', 'bfae6b414decaa510f6562bec57d4b0980569e58'
end
