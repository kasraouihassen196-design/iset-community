import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'community_screens.dart';

/// Main layout with bottom navigation.
/// Guests (public mode) only get Home; other tabs ask them to sign in.
class AppShell extends StatefulWidget {
  final bool isGuest;
  const AppShell({super.key, required this.isGuest});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final g = widget.isGuest;
    final pages = <Widget>[
      HomeScreen(isGuest: g),
      g ? const LockedView(title: 'Messages') : const ChatsScreen(),
      g ? const LockedView(title: 'Study groups') : const GroupsScreen(),
      g ? const LockedView(title: 'Files') : const FilesScreen(),
      g ? const LockedView(title: 'Profile') : const ProfileScreen(),
    ];
    return Scaffold(
      body: SafeArea(child: IndexedStack(index: _index, children: pages)),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.chat_bubble_outline), selectedIcon: Icon(Icons.chat_bubble), label: 'Chats'),
          NavigationDestination(icon: Icon(Icons.groups_outlined), selectedIcon: Icon(Icons.groups), label: 'Groups'),
          NavigationDestination(icon: Icon(Icons.folder_outlined), selectedIcon: Icon(Icons.folder), label: 'Files'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
