---

# WhatsApp UI Clone

This project is a UI clone of WhatsApp built with Flutter. It consists of a splash screen and a multi-tabbed home page featuring Camera, Chats, Status, and Calls tabs. The design focuses on mimicking WhatsApp's UI, making use of Flutter's powerful widget system.

## Key Features
- **Splash Screen**: Displays the WhatsApp logo and transitions to the main screen after 1 second.
- **Tabbed Navigation**: Includes four tabs for Camera, Chats, Status, and Calls.
- **Custom UI Elements**: Chats, statuses, and calls are generated dynamically using `ListView.builder`.
- **Popup Menu**: Contains options for "New Group", "Settings", and "Logout".

---

## Screen Records
https://github.com/user-attachments/assets/217a5200-1139-45cc-b8db-21add6ebd5ec


---

## Project Structure

### 1. `main.dart`
This file initializes the app, applying a theme and setting the entry point to the `SplashScreen`.

#### Key Code:
```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp UI Clone',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: SplashScreen(), // Entry point of the app
      debugShowCheckedModeBanner: false,
    );
  }
}
```

### 2. `splash_screen.dart`
Implements a simple splash screen that appears for 1 second, showing the WhatsApp logo and some text. After 1 second, the app navigates to the home page.

#### Key Code:
```dart
Timer(Duration(seconds: 1), () {
  Navigator.pushReplacement(
    context, MaterialPageRoute(builder: (context) => HomePage())
  );
});
```

### 3. `home_page.dart`
The main UI of the app, featuring a `TabBar` with Camera, Chats, Status, and Calls tabs. The chats, statuses, and calls are dynamically generated using a `ListView.builder`.

#### Key Features:
- **TabBar with Four Tabs**: Camera, Chats, Status, and Calls.
- **Dynamic Content**: Uses `ListView.builder` for chats, statuses, and calls.
- **Custom Popup Menu**: Provides options like "New Group", "Settings", and "Logout".

#### Key Code:
```dart
return DefaultTabController(
  length: 4,
  child: Scaffold(
    appBar: AppBar(
      title: Text('WhatsApp'),
      bottom: TabBar(
        tabs: [
          Tab(icon: Icon(Icons.camera_alt_outlined)),
          Tab(text: 'Chats'),
          Tab(text: 'Status'),
          Tab(text: 'Calls'),
        ],
      ),
      actions: [
        Icon(Icons.search),
        PopupMenuButton(
          itemBuilder: (context) => [
            PopupMenuItem(value: '1', child: Text('New Group')),
            PopupMenuItem(value: '2', child: Text('Settings')),
            PopupMenuItem(value: '3', child: Text('Logout')),
          ],
        ),
      ],
    ),
    body: TabBarView(
      children: [
        Center(child: Text('Camera Tab')),
        _buildChatsList(), // Dynamically builds chat items
        _buildStatusList(),
        _buildCallList(),
      ],
    ),
  ),
);
```

---

## How to Run the Project

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/whatsapp_ui_clone.git
   ```
2. Navigate to the project directory:
   ```bash
   cd whatsapp_ui_clone
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

---

## Dependencies
- **Flutter**: The project is built using Flutter for the UI.
- **Material Components**: Includes `AppBar`, `TabBar`, `ListView.builder`, and more for a responsive and functional UI.
- **Network Images**: Uses `Image.network` to display images from external sources.

---

Feel free to contribute or suggest improvements!

---

## License
[MIT License](LICENSE)

---

