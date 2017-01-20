Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
    'LwcYCao342N6XJ0wjNooHeuLGMpoahG6',
    'WJ6jo3dShUhCdt3knND6MpxFUF9CKm1owA5dsND_QJPdUYJfGzEHCMuCZYaEv6HM',
    'studyspace.auth0.com',
    callback_path: "/auth/oauth2/callback"
  )
end