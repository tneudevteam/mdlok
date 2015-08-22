Meteor.methods
  'auth': (credentials) ->
    apiResponse = getAPIResponse credentials

    if apiResponse.success
      if not userRegistered credentials.login
        userId = registerUser _.extend credentials, {cookies: apiResponse.cookies}
        insertStudent userId, apiResponse.student
        true
      else
        true
    else
      false

getAPIResponse = (credentials) ->
  apiResponse = HTTP.get "https://moduleok.appspot.com/api/getScores?v=2" +
      "&login=#{credentials.login}&password=#{credentials.password}"
  JSON.parse apiResponse.content

userRegistered = (username) ->
  Meteor.users.find(username: username).count() > 0

registerUser = (credentials) ->
  Accounts.createUser
    username: credentials.login
    password: credentials.password
    profile:
      hash: credentials.cookies

insertStudent = (userId, student) ->
  Students.insert StudentAdapter(student).mergeSemesters().addAverageScore().get()