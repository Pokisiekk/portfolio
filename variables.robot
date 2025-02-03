*** Variables ***
# REQRES API
${REQRES_URL}            https://reqres.in/api
${SESSION}               reqres
${TOKEN}                 QpwL5tke4Pnpja7X4
${EMAIL}                 eve.holt@reqres.in

# API requests
${USERS}                 /users
${LIST_USERS}            /users?page=2
${USER_2}                /users/2
${USER_48}               /users/48
${REGISTER}              /register
${LOGIN}                 /login

# orangeHRM website
${URL}                   https://opensource-demo.orangehrmlive.com
${BROWSER}               Chrome
${USERNAME}              Admin
${PASSWORD}              admin123
${WAITING_TIME}          10s
${NAME}                  Rebecca
${TEST_SURNAME}          Harmony
${TEST_FULL_NAME}        ${NAME} ${TEST_SURNAME}
${ADMIN_USER_ROLE}       Admin
${ESS_USER_ROLE}         ESS

# XPATHS
${DIRECTORY_TAB}         xpath://a[@href='/web/index.php/directory/viewDirectory']
${DIRECTORY_TITLE}       xpath://h6[text()="Directory"]
${DIRECTORY_INPUT}       xpath://input[@placeholder='Type for hints...']
${LISTBOX}               xpath://div[@role='listbox']
${LISTBOX_ADMIN}         xpath=//div[@role='listbox']//*[normalize-space(text())="Admin"]
${LISTBOX_ESS}           xpath=//div[@role='listbox']//*[normalize-space(text())="ESS"]
${SUBMIT_BUTTON}         xpath://button[@type="submit"]
${WANTED_USER}           xpath://p[contains(normalize-space(.), "${TEST_FULL_NAME}")]
${ADMIN_TAB}             xpath://a[@href='/web/index.php/admin/viewAdminModule']
${ADMIN_TITLE}           xpath://h6[text()="Admin"]
${USER_ROLE}             xpath=(//div[@class="oxd-select-text-input" and normalize-space(text())="-- Select --"])[1]
${RECORDS_FILED}         xpath=//div[@class="orangehrm-horizontal-padding orangehrm-vertical-padding"]//span[contains(normalize-space(.), 'Records Found')]
${RESET_BUTTON}          xpath=//button[@type="button" and normalize-space(.)="Reset"]
${TIME_TAB}              xpath://a[@href='/web/index.php/time/viewTimeModule']
${TIME_TITLE}            xpath://h6[text()="Time"]
${PROJECT_INFO}          xpath://span[normalize-space(.)="Project Info"]
${CUSTOMERS}             xpath=//a[text()="Customers"]
