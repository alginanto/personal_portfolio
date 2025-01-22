import 'package:flutter/material.dart';
import 'package:portfolio/models/portfolio_data.dart';

class ResumePage extends StatelessWidget {
  const ResumePage(
      {super.key, required this.experiences, required this.education});

  final List<ExperienceItem> experiences;
  final List<EducationItem> education;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 800;
        final double padding = isMobile ? 20.0 : 100.0;

        return Container(
          padding: EdgeInsets.all(padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'My Resume',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 48),
              if (isMobile) ...[
                _buildExperienceSection(experiences),
                const SizedBox(height: 48),
                _buildEducationSection(education),
              ] else
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildExperienceSection(experiences)),
                    const SizedBox(width: 48),
                    Expanded(child: _buildEducationSection(education)),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildExperienceSection(List<ExperienceItem> experiences) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Job Experience',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24),
        ...experiences.map((exp) => _buildExperienceCard(
              exp.period,
              exp.title,
              exp.company,
            )),
      ],
    );
  }

  Widget _buildEducationSection(List<EducationItem> education) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Education',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24),
        ...education.map((edu) => _buildExperienceCard(
              edu.period,
              edu.degree,
              edu.institution,
            )),
      ],
    );
  }

  Widget _buildExperienceCard(String period, String title, String company) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(24),
      constraints: const BoxConstraints(
        minWidth: 400, // Minimum width for all cards
      ),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            period,
            style: const TextStyle(color: Colors.red),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            company,
            style: TextStyle(color: Colors.grey[400]),
          ),
        ],
      ),
    );
  }
}
