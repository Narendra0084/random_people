# random_people

A new Flutter project.

## Getting Started

Main And First instruction to developer.

Platform-specific setup.
iOS:
ObjectBox supports only the 64-bit architecture on iOS.
Follow these step : Go to X-Code then Runner -> Build setting then architecture then set this: $ARCHS_STANDARD_64_BIT

Android:
ObjectBox support random SDK in android and some time don't create objectbox local storage file beacuse some privicy:
Minmum SDK version 21
flutter package version -> objectbox_flutter_libs: device wise.
Some need to change flutter SDK.

Reference: https://github.com/objectbox/objectbox-dart/issues/622


App Functionality Use case: 

1. Consume the Random User Generator API and Store Data Locally
The application consumes the Random User Generator API to fetch random user data. It then saves this data locally using ObjectBox, a local database management library.

2. Display Users in a List
Users are displayed in a list format, showing their first and last names along with their age.

3. Sort Users
The application provides functionality to sort the list of users by their first names in ascending or descending order. Users can choose to sort the list alphabetically by name & age.

4. Show Youngest Users
Users can filter and display the two youngest users from the list.

5. Edit Users
Users can edit user information by selecting multiple users from the list. Upon clicking the edit button, checkboxes appear next to each user,
 This functionality is implemented through a query-based editing feature and user can change test file.

7. Delete Users
Users can delete user information by selecting one or more users from the list.

8. Error Handling and Data Validation
The application includes error handling and data validation to ensure that only valid data is saved to the database. During API calls and displays error messages to the user. Additionally, ensure that only valid user data is stored in the local database.
