# TCAssignment

The repository consists of a project as an assignment for TrueCaller interview. It scrapes their blog to obtain specific characters which is displayed in a simple UI.



Brief explanation of the solution : 

Following is a brief description of contents of the projects in the project folders.

Controllers - Main view Controller for the project
Views - UI made using Storyboard
Utils - Extensions to strings to perform tasks such as removal of while spaces, from the received response and Constants contains string literal values.

Alamofire is used, added via pods, for sending network requests.

Getting the first 10th character from the blog is performed directly by passing index in the substring.

To get every 10th,20th .. character white spaces is first removed from the received string using ext "removingWhitespacesString" and copied to the string "stringOfRemovedWhiteSpaces".  Every 10th characted from this string thus obtained is appended to "n10thArrays" which is then converted to comma separeted string and displayed in a *scroll view* in the UI (as there are many characters)

To get the count of words, white spaces is removed and copied to an array using ext "removingWhitespaces". Thus "arrayOfRemovedWhitespaces" contains an array of all the words, however, this also contains some "space" as words which is removed using a for loop checking character count and which is then appended to new array "newRemovedEmptyElements". The count of which is our word count.
