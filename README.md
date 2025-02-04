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
└── test_sets               # Directory containing test suites
    ├── ESP32-S3            # Files related to ESP32-S3 microcontroller
    │   ├── keywords.robot  # Custom keywords for test automation
    │   ├── tests.robot     # Test cases
    │   └── variables.robot # Variables used in tests
    ├── orangeHRM           # Files related to OrangeHRM website
    │   ├── keywords.robot  
    │   ├── tests.robot     
    │   └── variables.robot 
    └── reqresAPI           # Files related to Reqres API
        ├── keywords.robot  
        ├── tests.robot     
        └── variables.robot 
```

## How to run tests

The following instructions were prepared and tested on Linux. Running tests from other systems is
possible, but requires minor changes to the process.
To execute the tests, follow these steps:

1. Clone the repository

    ```
    git clone https://github.com/Pokisiekk/portfolio.git
    cd portfolio
    ```

1. Set up the test environment

    ```
    python3 -m venv venv
    source venv/bin/activate
    pip install -r requirements.txt
    ```

1. Run tests for a specific module

    1. ESP32-S3 tests:

        ```
        robot test_sets/ESP32-S3/tests.robot
        ```

    1. OrangeHRM tests:

        ```
        robot test_sets/orangeHRM/tests.robot
        ```

    1. ReqRes API tests:

        ```
        robot test_sets/reqresAPI/tests.robot
        ```

## Objects under Tests

The project includes automated tests for different types of objects:

1. **ESP32-S3**: Tests related to the ESP32-S3 microcontroller, including firmware validation,
    connectivity, and functional checks. For testing purposes, MicroPython was installed on the
    board - [MicroPython](https://micropython.org/download/ESP32_GENERIC_S3/).

1. **OrangeHRM**: Automated tests for OrangeHRM, an open-source human resource management system.
    The tests verify functionalities such as login, user management, and role assignments.

1. ***ReqRes API**: Tests for ReqRes, a mock REST API used for testing. The tests validate HTTP
    responses, status codes, and data integrity.
