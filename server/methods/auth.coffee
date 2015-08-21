Meteor.methods
  'auth': (credentials) ->
    apiResponse = HTTP.get "https://moduleok.appspot.com/api/getScores?v=2" +
        "&login=#{credentials.login}&password=#{credentials.password}"
    jsonResponse = JSON.parse apiResponse.content
