# Portfolio

Welcome to my portfolio! 👋
This repository contains examples of my work related to test automation. The
project shows my skills in creating, implementing and managing automated tests.
I am able to write tests in any language, but in this case I focused mainly on
Robotframwrok, as it is my favorite tool to work with.

## Project Structure

The project is organized into different test sets, each targeting a specific object under test.
The structure is as follows:

```
.
├── README.md               # Project documentation
├── requirements.txt        # Dependencies required to run the tests
├── run_all_tests.bash      # Script to run all tests
└── test_sets               # Directory containing test suites
    ├── ESP32-S3            # Files related to ESP32-S3 microcontroller
    │   ├── keywords.robot  # Custom keywords for test automation
    │   ├── tests.robot     # Test cases
    │   └── variables.robot # Variables used in tests
    ├── orangeHRM           # Files related to OrangeHRM website
    │   ├── keywords.robot
    │   ├── tests.robot
    │   └── variables.robot
    └── reqresAPI           # Files related to ReqRes API
    │   ├── keywords.robot  
    │   ├── tests.robot     
    │   └── variables.robot 
    └── youtube             # Files related to youtube
        ├── keywords.robot  
        ├── tests.robot     
        └── variables.robot
```

## How to run tests

The following instructions were prepared and tested on Linux. Running tests from other systems is
possible, but requires minor changes to the process.

### Requirements

For the ESP32-S3 tests, the following requirements must be met:

* An ESP32-S3 board with MicroPython firmware installed –
  [MicroPython](https://micropython.org/download/ESP32_GENERIC_S3/).
* A USB-A to USB-C cable to connect the board to the host.
* Adjust the **${PORT}** variable to your configuration in the *test_sets/ESP32-S3/variables.robot*
  file.

For the other tests, an internet connection is required.

### Steps to run tests

To execute the tests, follow these steps:

1. Clone the repository:

    ```
    git clone https://github.com/Pokisiekk/portfolio.git
    cd portfolio
    ```

1. Set up the test environment:

    ```
    python3 -m venv venv
    source venv/bin/activate
    pip install -r requirements.txt
    rfbrowser init
    ```

1. Run tests for a specific module:

    * ESP32-S3 tests:

        ```
        robot test_sets/ESP32-S3/tests.robot
        ```

    * OrangeHRM tests:

        ```
        robot test_sets/orangeHRM/tests.robot
        ```

    * ReqRes API tests:

        ```
        robot test_sets/reqresAPI/tests.robot
        ```
    
    * Youtube tests:

        ```
        robot test_sets/youtube/tests.robot
        ```

### Test Script

The repository contains a script(*run_all_tests.bash*) that creates a temporary virtual environment,
installs the required libraries and dependencies, and then runs all the tests.

It is also adaptad to run on Windows by running it in the Git bash:

 ```
bash run_all_tests.bash
```

## Objects under Tests

The project includes automated tests for different types of objects using different libraries:

1. **ESP32-S3**: The tests related to the ESP32-S3 microcontroller, including firmware validation,
     connectivity, and functional checks. For testing purposes, MicroPython was installed on the
     board. Tests are based on the
     [SerialLibrary](https://github.com/whosaysni/robotframework-seriallibrary).

1. **OrangeHRM**: Automated tests for OrangeHRM, an open-source human resource management system.
     The tests verify functionalities such as login, user management, and role assignments. Tests
     are based on the
     [SeleniumLibrary](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html).

1. **ReqRes API**: The tests for ReqRes, a mock REST API used for testing. Tests validate HTTP
     responses, status codes, and data integrity. Tests are based on the
     [RequestsLibrary](https://marketsquare.github.io/robotframework-requests/doc/RequestsLibrary.html).

1. **Youtube**: World-famous website for sharing content, mainly video. The tests check the loading
     of individual tabs, video operations and checking the capabilities of some basic
     functionalities. Tests are based on the
     [Browser](https://marketsquare.github.io/robotframework-browser/Browser.html) library.
