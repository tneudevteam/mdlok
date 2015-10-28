Meteor.methods
  'auth': (credentials) ->
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

  'refresh': ->
    student = Students.findOne(userId: @userId)
    console.log student.phpsessid
    refreshResponse = getRefreshResponse student.phpsessid
    if refreshResponse.success is false
      # Logout user to get a new token
      Meteor.users.remove {_id: @userId}
      Students.remove {userId: @userId}
    else
      updateStudent @userId, refreshResponse.student

getLoginResponse = (credentials) ->
  try
    apiResponse = HTTP.get "https://moduleok.appspot.com/api/getScoresByPassword?" +
        "login=#{credentials.login}&password=#{credentials.password}"
    JSON.parse apiResponse.content
  catch e
    success: false

getRefreshResponse = (phpsessid) ->
  try
    apiResponse = HTTP.get "https://moduleok.appspot.com/api/getScoresByHash?" +
        "hash=#{phpsessid}"
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
  Students.insert(
    StudentAdapter(loginResponse.student).mergeSemesters()
                            .addAverageScore()
                            .withUserId(userId)
                            .withPhpSessId(loginResponse.phpsessid)
                            .withSelectedSemester()
                            .get()
  )

updateStudent = (userId, student) ->
  Students.update {userId: userId}, {
    $set:
      name: student.name
      group: student.group
      semesters: [student.firstSemester, student.secondSemester]
  }