# MechMate Box – Flutter UI Project

A clean, beginner-friendly Flutter UI project that simulates a basic authentication flow with modern design and validation logic. This project includes **Registration**, **Login**, and **Sign Up** screens, along with a final **Welcome** screen, built using Flutter’s `Material` components and custom styling.

---

## Overview

This project demonstrates foundational Flutter skills such as:
- Screen navigation using `Navigator`
- Form validation for empty inputs and email formats
- Password visibility toggle
- Custom theming and widget composition

---

##  Features

-  **Registration Screen**
  - Entry point of the app
  - Options to navigate to Login or Sign Up
  - Brand UI with a logo and welcome message

-  **Login Screen**
  - Email and password input fields
  - Validates empty fields and email format
  - Toggle to show/hide password
  - Navigates to Welcome screen on successful login

-**Sign Up Screen**
  - Fields for Name, Contact Number, Email, Password
  - Validates each field (non-empty, valid email)
  - Password visibility toggle
  - Redirects to Welcome screen upon valid submission

- **Welcome Screen**
  - Simple welcome message with branding
  - Confirmation of successful login/sign up


## Validation Logic

All forms enforce the following input validations:

- 🔴 **Empty Fields:** Submission is blocked if any required input is left empty.
- 📧 **Invalid Email Format:** Uses RegEx to ensure proper email formatting.
- 📢 **Error Feedback:** `SnackBar` is used for real-time feedback on user actions.


🤝 Contributing
This project was built for learning purposes. Suggestions, improvements, or pull requests are welcome!

🧑‍🎓 Author
Shayan Khan
Beginner Flutter Developer – exploring UI/UX and app development with Flutter.
Feel free to connect or contribute to this growing project.


Email: mshayankhan258@gmail.com 