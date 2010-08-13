# Facebook
oauthconfig = YAML.load_file(Rails.root.join('config', 'oauth_facebook.yml'))[Rails.env]
OAuthClientFacebook = OAuth2::Client.new(oauthconfig['api_key'], oauthconfig['api_secret'], :site => 'https://graph.facebook.com')

# Twitter
oauthconfig = YAML.load_file(Rails.root.join('config', 'oauth_twitter.yml'))[Rails.env]
OAuthClientTwitter = OAuth2::Client.new(oauthconfig['api_key'], oauthconfig['api_secret'], :site => 'https://graph.facebook.com')

# Gowalla
oauthconfig = YAML.load_file(Rails.root.join('config', 'oauth_gowalla.yml'))[Rails.env]
OAuthClientGowalla = OAuth2::Client.new(oauthconfig['api_key'], oauthconfig['api_secret'], :site => 'https://graph.facebook.com')