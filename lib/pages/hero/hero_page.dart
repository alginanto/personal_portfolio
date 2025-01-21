import 'package:flutter/material.dart';
import 'package:portfolio/models/portfolio_data.dart';

class HeroPage extends StatelessWidget {
  const HeroPage({super.key, required this.info});
  final PersonalInfo info;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 800;
        final double padding = isMobile ? 20.0 : 100.0;

        return Container(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: isMobile
              ? _buildMobileHeroContent(info, constraints)
              : _buildDesktopHeroContent(info, constraints),
        );
      },
    );
  }

  Widget _buildMobileHeroContent(
      PersonalInfo info, BoxConstraints constraints) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 32),
        _buildHeroText(info),
        const SizedBox(height: 32),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            info.imageUrl,
            height: 300,
            width: 300,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          alignment: WrapAlignment.center,
          children: info.stats
              .map((stat) => _buildStat(stat.value, stat.label))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildDesktopHeroContent(
      PersonalInfo info, BoxConstraints constraints) {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: constraints.maxWidth / 2, child: _buildHeroText(info)),
              const SizedBox(height: 32),
              Wrap(
                spacing: 28,
                runSpacing: 28,
                children: info.stats
                    .map((stat) => _buildStat(stat.value, stat.label))
                    .toList(),
              ),
            ],
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            info.imageUrl,
            height: 400,
            width: 400,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  Widget _buildHeroText(PersonalInfo info) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Hello, I\'m',
          style: TextStyle(color: Colors.red, fontSize: 24),
        ),
        const SizedBox(height: 8),
        Text(
          info.name,
          style: const TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          info.title,
          style: const TextStyle(fontSize: 24, color: Colors.grey),
        ),
        const SizedBox(height: 24),
        Text(
          info.description,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildStat(String value, String label) {
    return Container(
      width: 150,
      height: 150,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(color: Colors.grey, fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
