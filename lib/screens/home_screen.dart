import 'package:flutter/material.dart';
import '../theme.dart';

class HomeScreen extends StatelessWidget {
  final bool isGuest;
  const HomeScreen({super.key, required this.isGuest});

  static const _shortcuts = [
    (Icons.info_outline, 'ISET info'),
    (Icons.campaign_outlined, 'Announce.'),
    (Icons.event_outlined, 'Events'),
    (Icons.menu_book_outlined, 'Guides'),
    (Icons.contacts_outlined, 'Contacts'),
    (Icons.sports_esports_outlined, 'Games'),
    (Icons.smart_toy_outlined, 'AI help'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        // Header
        Row(
          children: [
            const AppLogo(size: 44),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(isGuest ? 'Welcome' : 'Hello, Student',
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                  Text(isGuest ? 'Public mode' : 'Student mode',
                      style: const TextStyle(color: AppColors.muted)),
                ],
              ),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none)),
          ],
        ),
        const SizedBox(height: 20),

        // Search
        const TextField(
          decoration: InputDecoration(
            hintText: 'Search guides, events, contacts…',
            prefixIcon: Icon(Icons.search),
          ),
        ),
        const SizedBox(height: 16),

        // Connection status
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            children: [
              const CircleAvatar(
                backgroundColor: AppColors.surface2,
                child: Icon(Icons.wifi, color: AppColors.primary),
              ),
              const SizedBox(width: 14),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Campus Wi-Fi', style: TextStyle(fontWeight: FontWeight.w600)),
                    Text('2 messages waiting to send',
                        style: TextStyle(color: AppColors.muted, fontSize: 13)),
                  ],
                ),
              ),
              TextButton(onPressed: () {}, child: const Text('Details')),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // Shortcuts
        SizedBox(
          height: 86,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: _shortcuts.length,
            separatorBuilder: (_, __) => const SizedBox(width: 14),
            itemBuilder: (_, i) {
              final s = _shortcuts[i];
              return Column(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: AppColors.surface2,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Icon(s.$1, color: AppColors.primary),
                  ),
                  const SizedBox(height: 6),
                  Text(s.$2, style: const TextStyle(fontSize: 12, color: AppColors.muted)),
                ],
              );
            },
          ),
        ),
        const SizedBox(height: 16),

        // Announcement banner
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(22),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Announcement',
                  style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w600)),
              SizedBox(height: 6),
              Text('Exam timetable is now available',
                  style: TextStyle(
                      color: Colors.black, fontSize: 20, fontWeight: FontWeight.w800)),
              SizedBox(height: 6),
              Text('Check the student guides section for the full schedule.',
                  style: TextStyle(color: Colors.black87)),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // Events
        const Text('Upcoming events',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
        const SizedBox(height: 12),
        const _EventTile(day: '14', month: 'Nov', title: 'Robotics club meeting', place: 'Room B12'),
        const _EventTile(day: '18', month: 'Nov', title: 'Career day', place: 'Main hall'),
        const _EventTile(day: '22', month: 'Nov', title: 'Programming contest', place: 'Computer lab 2'),
      ],
    );
  }
}

class _EventTile extends StatelessWidget {
  final String day, month, title, place;
  const _EventTile({required this.day, required this.month, required this.title, required this.place});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Container(
            width: 52,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(color: AppColors.surface2, borderRadius: BorderRadius.circular(12)),
            child: Column(children: [
              Text(day, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: AppColors.accent)),
              Text(month, style: const TextStyle(fontSize: 12, color: AppColors.muted)),
            ]),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
              Text(place, style: const TextStyle(color: AppColors.muted, fontSize: 13)),
            ]),
          ),
        ],
      ),
    );
  }
}
