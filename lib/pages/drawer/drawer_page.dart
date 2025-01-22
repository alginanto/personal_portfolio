import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  final List<String> navItems;
  final Function(int) onItemSelected;
  final VoidCallback onDownloadCV;

  const NavDrawer({
    super.key,
    required this.navItems,
    required this.onItemSelected,
    required this.onDownloadCV,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFF1A1A1A),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'ALGIN ANTO',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ...navItems.map((item) => ListTile(
                  title: Text(
                    item,
                    style: const TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    onItemSelected(navItems.indexOf(item));
                    Navigator.pop(context);
                  },
                )),
            const Divider(color: Colors.grey),
            ListTile(
              title: const Text(
                'DOWNLOAD CV',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                onDownloadCV();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
