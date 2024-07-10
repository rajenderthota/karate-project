Feature: Loop one API response to another API request

Background:
  * url 'https://jsonplaceholder.typicode.com'

Scenario: Get user details for each user
  Given path 'users'
  When method get
  Then status 200
  * def users = response

  # Initialize an empty array to store user details
  * def userDetails = []

  # Define the function to call another API
  * def getUserDetails = 
  """
  function(id) {
          karate.log('Calling user-details.feature with id:', id);
    var response = karate.call('classpath:examples/users/user-details.feature', { id: id });
    return response.result;
  }
  """

  # Loop through each user and make another API call to get details
  * def fetchDetails = 
  """
  function(users) {
    var details = [];
    for (var i = 0; i < users.length; i++) {
      var detail = getUserDetails(users[i].id);
      details.push(detail);
    }
    return details;
  }
  """
  * def userDetails = fetchDetails(users)

  # Log the user details
  * print userDetails
