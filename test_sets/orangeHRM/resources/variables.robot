*** Variables ***
${URL}                   https://opensource-demo.orangehrmlive.com
${BROWSER}               Chrome
${USERNAME}              Admin
${PASSWORD}              admin123
${DEFAULT_TIMEOUT}       10s
${NAME}                  Rebecca
${TEST_SURNAME}          Harmony
${TEST_FULL_NAME}        ${NAME} ${TEST_SURNAME}
${ADMIN_USER_ROLE}       Admin
${ESS_USER_ROLE}         ESS

${DIRECTORY_TAB}         xpath=//a[@href='/web/index.php/directory/viewDirectory']
${ADMIN_TAB}             xpath=//a[@href='/web/index.php/admin/viewAdminModule']
${TIME_TAB}              xpath=//a[@href='/web/index.php/time/viewTimeModule']
${DIRECTORY_TITLE}       xpath=//h6[text()="Directory"]
${ADMIN_TITLE}           xpath=//h6[text()="Admin"]
${TIME_TITLE}            xpath=//h6[text()="Time"]
${DASHBOARD_TITLE}       xpath=//h6[text()="Dashboard"]
${CUSTOMERS}             xpath=//a[text()="Customers"]
${PROJECT_INFO}          xpath=//span[normalize-space(.)="Project Info"]
${DIRECTORY_INPUT}       xpath=//input[@placeholder='Type for hints...']
${WANTED_USER}           xpath=//p[contains(normalize-space(.), "${TEST_FULL_NAME}")]
${LISTBOX}               xpath=//div[@role='listbox']
${LISTBOX_ADMIN}         xpath=//div[@role='listbox']//*[normalize-space(text())="Admin"]
${LISTBOX_ESS}           xpath=//div[@role='listbox']//*[normalize-space(text())="ESS"]
${SUBMIT_BUTTON}         xpath=//button[@type="submit"]
${RESET_BUTTON}          xpath=//button[@type="button" and normalize-space(.)="Reset"]
${USER_ROLE}             xpath=(//div[@class="oxd-select-text-input" and normalize-space(text())="-- Select --"])[1]
${RECORDS_FILED}         xpath=//div[@class="orangehrm-horizontal-padding orangehrm-vertical-padding"]//span[contains(normalize-space(.), 'Records Found')]
