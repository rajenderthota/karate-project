Feature: Read files in a loop

  Scenario: Reading multiple files
    * def files = ['data1.json', 'data2.json'] // List of file names
    * def data = []

    # Loop through each file
    * eval for (var i = 0; i < files.length; i++) {
      var fileData = read('classpath:examples/karate/data/' + files[i]);
      data.push(fileData);
    }

    # Print the data
    * print data
