                                     NAME: ISHIMWE MWIZA GRACE
                                     ID: 25192





                      ASSIGNMENT 3
This Flutter application showcases a comprehensive implementation of multi-screen navigation, state management, and integration of essential device functionalities. Here's a breakdown of its key components:

App Initialization and Theme Management:

The MyApp class initializes the Flutter app using WidgetsFlutterBinding.ensureInitialized() and sets up a theme mode (light or dark) controlled by user preference. It uses MaterialApp for overall app configuration, including title and theme settings.
Local Notifications:

Utilizes FlutterLocalNotificationsPlugin for displaying notifications related to battery status updates. Initialization settings for Android are configured using AndroidInitializationSettings.
Battery and Connectivity Handling:

Monitors battery state changes using Battery package and triggers notifications when the battery level reaches a specified threshold during charging. The onBatteryStateChanged event listens for charging events and updates notifications accordingly.
Utilizes Connectivity package to display real-time internet connectivity status through a SnackBar, informing users of internet connection availability or lack thereof.
Navigation and Screen Management:

Implements a HomeScreen class that serves as the central hub with a bottom navigation bar (BottomNavigationBar). This navigation bar enables seamless switching between three primary screens: Sign In, Sign Up, and Calculator.
Each screen (SignInScreen, SignUpScreen, CalculatorScreen) is encapsulated as a separate widget with specific functionalities tailored to user authentication and calculation needs.
Sign In and Sign Up Functionality:

The SignInScreen and SignUpScreen feature form validation and input handling for email, password, full name, username, phone number, and date of birth. Input fields are styled dynamically based on the selected theme (light or dark).
Calculator Screen:

The CalculatorScreen provides basic arithmetic operations (+, -, *, /) and calculates results dynamically based on user input. It updates the display in real-time, providing a responsive user experience.
UI/UX Design:

The app employs thoughtful design elements such as gradient-themed app bars, custom drawer headers, and icon-based navigation items. Dynamic theming ensures a visually appealing and user-friendly interface across different screens and themes.
Code Structure and State Management:

Uses stateful and stateless widgets to manage screen states and data flow efficiently. State management is handled within widget classes (StatefulWidget and StatelessWidget), ensuring modular and maintainable code structure.
This application exemplifies best practices in Flutter app development, leveraging its rich ecosystem of packages and widgets to deliver a cohesive user experience with robust functionality and intuitive navigation.






