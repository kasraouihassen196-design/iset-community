# ISET Community App - front-end

Flutter UI only (mock data, no backend yet).

## Run
1. Create the platform folders once, inside this folder:
   flutter create . --platforms=android,windows
2. flutter pub get
3. flutter run            (or: flutter run -d windows)

## Structure
lib/main.dart                      app + routes
lib/theme.dart                     colors (edit to match your logo) + placeholder logo
lib/screens/login_screen.dart      login + "continue without an account" (public mode)
lib/screens/shell.dart             bottom navigation (guests see Home only)
lib/screens/home_screen.dart       header, search, connection status, shortcuts, announcement, events
lib/screens/community_screens.dart chats, groups, files, profile, locked view

## Where the backend plugs in later
- login_screen.dart -> _login()  (TODO comment)
- chats/groups/files lists are hard-coded; replace with data from the local DB + connection manager
