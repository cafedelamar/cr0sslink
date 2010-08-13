oauthconfig = YAML.load_file(Rails.root.join('config', 'oauth.yml'))[Rails.env]
OAuthClient = OAuth2::Client.new(oauthconfig['api_key'], oauthconfig['api_secret'], :site => 'https://graph.facebook.com')