Meteor.methods
  auth: (credentials) ->
    loginResponse = getLoginResponse credentials

    if loginResponse.success
      if not userRegistered credentials.login
        userId = registerUser credentials
        insertStudent userId, loginResponse
        true
      else
        true
    else
      false

  refresh: ->
    student = Students.findOne(userId: @userId)
    if student.phpsessid is null
      Meteor.users.remove {_id: @userId}
    else
      refreshResponse = getRefreshResponse student.phpsessid
      if refreshResponse.success is false
        # Logout user to get a new token
        Meteor.users.remove {_id: @userId}
         Students.remove {userId: @userId}
      else
        updateStudent @userId, refreshResponse

getLoginResponse = (credentials) ->
  try
    apiResponse = HTTP.get "https://moduleok.appspot.com/api/getScoresByPassword?" +
        "login=#{credentials.login}&password=#{credentials.password}"
    JSON.parse apiResponse.content
  catch e
    success: false

getRefreshResponse = (phpsessid, weirdCookie) ->
  try
    apiResponse = HTTP.get "https://moduleok.appspot.com/api/getScoresByHash?" +
        "hash=#{phpsessid}&weirdCookie=#{encodeURIComponent(weirdCookie)}"
    JSON.parse apiResponse.content
  catch e
    success: false

userRegistered = (username) ->
  Meteor.users.find(username: username).count() > 0

registerUser = (credentials) ->
  Accounts.createUser
    username: credentials.login
    password: credentials.password

insertStudent = (userId, loginResponse) ->
  student = StudentAdapter(loginResponse.student).withUserId(userId)
  .withWeirdCookie(loginResponse.$804c27b4e9d8b5a3183e7ab890c2d8f3)
  .withSessionId(loginResponse.phpsessid).get()
  Students.insert student

updateStudent = (userId, refreshResponse) ->
  oldStudent = Students.findOne {userId: userId}
  student = StudentAdapter(refreshResponse.student).withWeirdCookie(oldStudent.weirdCookie)
  .withUserId(userId).withSessionId(oldStudent.phpsessid).get()
  Students.update {userId: userId}, student