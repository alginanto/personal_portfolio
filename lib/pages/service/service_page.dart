import 'package:flutter/material.dart';
import 'package:portfolio/models/portfolio_data.dart';
import 'package:portfolio/widget/service_card.dart';

class ServicePage extends StatelessWidget {
  const ServicePage({super.key, required this.services});
  final List<ServiceItem> services;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 800;
        final double padding = isMobile ? 20.0 : 100.0;
        int crossAxisCount;
        if (isMobile) {
          crossAxisCount = 1;
        } else if (constraints.maxWidth < 1100) {
          crossAxisCount = 2;
        } else {
          crossAxisCount = 3;
        }

        return Container(
          padding: EdgeInsets.all(padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'What I Do',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 48),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  mainAxisSpacing: 24,
                  crossAxisSpacing: 24,
                  childAspectRatio: isMobile ? 1.5 : 1.2,
                ),
                itemCount: services.length,
                itemBuilder: (context, index) {
                  final service = services[index];
                  return ServiceCard(
                    title: service.title,
                    description: service.description,
                    backgroundImage:
                        'https://images.unsplash.com/photo-1654618977232-a6c6dea9d1e8?q=80&w=1972&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Widget _buildServiceCard(String title, String description, IconData icon) {
  //   return Container(
  //     padding: const EdgeInsets.all(24),
  //     decoration: BoxDecoration(
  //       color: Colors.grey[800],
  //       borderRadius: BorderRadius.circular(8),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.black.withOpacity(0.1),
  //           blurRadius: 10,
  //           offset: const Offset(0, 5),
  //         ),
  //       ],
  //     ),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Icon(icon, color: Colors.red, size: 40),
  //         const SizedBox(height: 16),
  //         Text(
  //           title,
  //           style: const TextStyle(
  //             fontSize: 20,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //         const SizedBox(height: 8),
  //         Text(
  //           description,
  //           style: TextStyle(color: Colors.grey[400]),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
