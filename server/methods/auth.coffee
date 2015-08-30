Meteor.methods
  'auth': (credentials) ->
    apiResponse = getAPIResponse credentials

    if apiResponse.success
      if not userRegistered credentials.login
        userId = registerUser _.extend credentials, {cookies: apiResponse.cookies}
        insertStudent userId, apiResponse.student, credentials
        true
      else
        true
    else
      false

  'refresh': ->
    student = Students.findOne(userId: @userId)
    apiResponse = getAPIResponse student.credentials
    updateStudent @userId, apiResponse.student

getAPIResponse = (credentials) ->
  try
    apiResponse = HTTP.get "https://moduleok.appspot.com/api/getScores?v=2" +
        "&login=#{credentials.login}&password=#{credentials.password}"
    JSON.parse apiResponse.content
  catch e
    success: false

userRegistered = (username) ->
  Meteor.users.find(username: username).count() > 0

registerUser = (credentials) ->
  Accounts.createUser
    username: credentials.login
    password: credentials.password
    profile:
      hash: credentials.cookies

insertStudent = (userId, student, credentials) ->
  Students.insert(
    StudentAdapter(student).mergeSemesters()
                            .addAverageScore()
                            .withUserId(userId)
                            .withCredentials(credentials)
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