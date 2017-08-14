Project 3
Requirements:
Create a form that an app would use to "sign up" a new user. The interface can look however you would like (it doesn't have to be pretty--we'll work on pretty later), but the project must meet the following requirements.

1) The user interface should have UITextFields for name, username, password, email address, and phone number. The keyboard should properly resign when pressing Done/Return for each text field. There should UILabels for the "title" of each text field, so the user knows what kind of information to type in. There should be placeholder text in each text field. Secure text entry must be used on the password text field, and a suitable type of keyboard should be used for each of the text fields respectively.

2) An image view with an image (stored in Assets.xcassets) must be present on the screen. Think of it like an app logo or icon or really whatever you want/can find. 

3) There should be an "Add" button at the bottom of the form which will create the user in your Model and then clear all the text fields. It should only be enabled when the input passes validation. 

4) You can add whatever input validation you would like for the text fields. The only REQUIRED input validation is: i) that the password be at least 7 characters long, ii) that the phone number does not contain any non-numeric characters, and iii) that the rest of the fields have at least 3 characters. (You do not have to validate that it is a correct email address or phone number, though you can if you like).

5) Research UITextView, a new component that we have not gone over in class, and place one in the bottom of the third of your screen. Disable editing on it. The text view should have a description of each user in the app on a separate line. (So for example when I press the "Add" button, a new user is added to the text view on a new line.) The description should have all the fields of the user in it.
