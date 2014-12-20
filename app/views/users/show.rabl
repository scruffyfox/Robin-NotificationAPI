object @user

attributes :id, :access_token, :last_mention

child :devices => :devices do
  extends "devices/index"
end