Meteor.methods
  'auth': (credentials) ->
    apiResponse = HTTP.get "https://moduleok.appspot.com/api/getScores?v=2" +
        "&login=#{credentials.login}&password=#{credentials.password}"
    jsonResponse = JSON.parse apiResponse.content

    if jsonResponse.success
      if not userRegistered credentials.login
        userId = registerUser _.extend credentials, {cookies: jsonResponse.cookies}
        console.log userId

        # code here...

        true
      else
        true
    else
      false

userRegistered = (username) ->
  Meteor.users.find(username: username).count() > 0

registerUser = (credentials, jsonResponse) ->
  Accounts.createUser
    username: credentials.login
    password: credentials.password
    profile:
      hash: credentials.cookies