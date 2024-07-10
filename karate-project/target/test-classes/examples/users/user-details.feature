Feature: Get user details

Scenario: Get user details by ID
  * def id = karate.get('id')
  * if (id ==null) karate.set('id', 1);
  
  * karate.log('Received id:', id)
  Given url 'https://jsonplaceholder.typicode.com/users/' + id
  When method get
  Then status 200
  * def userDetail = response
  * karate.set('result', userDetail)
