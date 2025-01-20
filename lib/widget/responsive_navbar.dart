// widgets/responsive_navbar.dart

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ResponsiveNavbar extends StatelessWidget {
  final List<String> navItems;
  final Function(int) onItemSelected;
  final VoidCallback onDownloadCV;

  const ResponsiveNavbar({
    super.key,
    required this.navItems,
    required this.onItemSelected,
    required this.onDownloadCV,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 800) {
              return _buildMobileNavbar(context, themeProvider);
            }
            return _buildDesktopNavbar(themeProvider);
          },
        );
      },
    );
  }

  Widget _buildDesktopNavbar(ThemeProvider themeProvider) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        children: [
          const Row(
            children: [
              FaIcon(
                FontAwesomeIcons.github,
                size: 50,
                color: Colors.white,
              ),
            ],
          ),
          const Spacer(),
          ...navItems.map((item) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextButton(
                  onPressed: () => onItemSelected(navItems.indexOf(item)),
                  child: Text(
                    item,
                    style: TextStyle(
                      color: themeProvider.isDarkMode
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              )),
          IconButton(
            icon: Icon(
              themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
              color: themeProvider.isDarkMode ? Colors.white : Colors.black,
            ),
            onPressed: () => themeProvider.toggleTheme(),
          ),
          ElevatedButton(
            onPressed: onDownloadCV,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            ),
            child: const Text('DOWNLOAD CV'),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileNavbar(BuildContext context, ThemeProvider themeProvider) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Text(
        'ALGIN',
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            color: themeProvider.isDarkMode ? Colors.white : Colors.black,
          ),
          onPressed: () => themeProvider.toggleTheme(),
        ),
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
        ),
      ],
    );
  }
}

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
              child: Text(
                'FORSTR',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
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
