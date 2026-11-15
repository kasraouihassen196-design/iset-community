import 'package:flutter/material.dart';
import '../theme.dart';

/// Shown to guests on screens that need an account.
class LockedView extends StatelessWidget {
  final String title;
  const LockedView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.lock_outline, size: 48, color: AppColors.muted),
            const SizedBox(height: 16),
            Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            const Text('Sign in with your student account to use this feature.',
                textAlign: TextAlign.center, style: TextStyle(color: AppColors.muted)),
            const SizedBox(height: 20),
            FilledButton(
              style: FilledButton.styleFrom(minimumSize: const Size(200, 48)),
              onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
              child: const Text('Sign in'),
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final String text;
  const _Header(this.text);
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
        child: Text(text, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
      );
}

// ---------- Chats ----------
class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  static const _chats = [
    ('Sarra B.', 'Did you get the lab notes?', '10:42', 2, false),
    ('Algorithms group', 'Meeting at 4pm in B12', '09:15', 0, false),
    ('Yassine M.', 'Sending the file when I connect', 'Yesterday', 0, true),
    ('Network class', 'Slides are shared', 'Mon', 5, false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.black,
        onPressed: () {},
        child: const Icon(Icons.edit_outlined),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _Header('Chats'),
          Expanded(
            child: ListView.builder(
              itemCount: _chats.length,
              itemBuilder: (_, i) {
                final c = _chats[i];
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  leading: CircleAvatar(
                    radius: 24,
                    backgroundColor: AppColors.surface2,
                    child: Text(c.$1[0], style: const TextStyle(fontWeight: FontWeight.w700)),
                  ),
                  title: Text(c.$1, style: const TextStyle(fontWeight: FontWeight.w600)),
                  subtitle: Row(children: [
                    if (c.$5) const Padding(
                      padding: EdgeInsets.only(right: 4),
                      child: Icon(Icons.schedule, size: 14, color: AppColors.accent),
                    ),
                    Expanded(child: Text(c.$2, maxLines: 1, overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: AppColors.muted))),
                  ]),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(c.$3, style: const TextStyle(fontSize: 12, color: AppColors.muted)),
                      if (c.$4 > 0)
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                          decoration: BoxDecoration(
                              color: AppColors.primary, borderRadius: BorderRadius.circular(10)),
                          child: Text('${c.$4}',
                              style: const TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w700)),
                        ),
                    ],
                  ),
                  onTap: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ---------- Groups ----------
class GroupsScreen extends StatelessWidget {
  const GroupsScreen({super.key});

  static const _groups = [
    ('Algorithms', '24 members', Icons.code),
    ('Networks', '18 members', Icons.router_outlined),
    ('Databases', '31 members', Icons.storage_outlined),
    ('English club', '12 members', Icons.translate),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _Header('Study groups'),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            padding: const EdgeInsets.all(20),
            mainAxisSpacing: 14,
            crossAxisSpacing: 14,
            children: [
              for (final g in _groups)
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: AppColors.surface, borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(g.$3, color: AppColors.primary, size: 30),
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(g.$1, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                        Text(g.$2, style: const TextStyle(color: AppColors.muted, fontSize: 13)),
                      ]),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

// ---------- Files ----------
class FilesScreen extends StatelessWidget {
  const FilesScreen({super.key});

  static const _files = [
    ('network_lab.pdf', '2.4 MB', 'Received via Wi-Fi Direct', Icons.wifi_tethering, true),
    ('algo_summary.docx', '640 KB', 'Sent via campus Wi-Fi', Icons.wifi, true),
    ('project_slides.pptx', '8.1 MB', 'Waiting for a connection', Icons.schedule, false),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _Header('Files'),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              for (final f in _files)
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                      color: AppColors.surface, borderRadius: BorderRadius.circular(16)),
                  child: Row(children: [
                    const Icon(Icons.insert_drive_file_outlined, color: AppColors.primary),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(f.$1, style: const TextStyle(fontWeight: FontWeight.w600)),
                        Text('${f.$2} • ${f.$3}',
                            style: const TextStyle(color: AppColors.muted, fontSize: 12)),
                      ]),
                    ),
                    Icon(f.$4, size: 18, color: f.$5 ? AppColors.muted : AppColors.accent),
                  ]),
                ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.upload_file),
            label: const Text('Send a file'),
          ),
        ),
      ],
    );
  }
}

// ---------- Profile ----------
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget tile(IconData icon, String label) => ListTile(
          leading: Icon(icon, color: AppColors.muted),
          title: Text(label),
          trailing: const Icon(Icons.chevron_right, color: AppColors.muted),
          onTap: () {},
        );

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const SizedBox(height: 12),
        const Center(
          child: CircleAvatar(
            radius: 46,
            backgroundColor: AppColors.surface2,
            child: Icon(Icons.person, size: 46, color: AppColors.primary),
          ),
        ),
        const SizedBox(height: 14),
        const Center(
            child: Text('Student Name',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800))),
        const Center(
            child: Text('student@iset.tn', style: TextStyle(color: AppColors.muted))),
        const SizedBox(height: 24),
        tile(Icons.edit_outlined, 'Edit profile'),
        tile(Icons.sync_alt, 'Connection preferences'),
        tile(Icons.notifications_none, 'Notifications'),
        tile(Icons.shield_outlined, 'Privacy and security'),
        const Divider(height: 32),
        ListTile(
          leading: const Icon(Icons.logout, color: Colors.redAccent),
          title: const Text('Sign out', style: TextStyle(color: Colors.redAccent)),
          onTap: () => Navigator.pushReplacementNamed(context, '/login'),
        ),
      ],
    );
  }
}
