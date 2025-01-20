// models/portfolio_data.dart

class PortfolioData {
  final PersonalInfo personalInfo;
  final List<ServiceItem> services;
  final List<PortfolioItem> portfolioItems;
  final List<ExperienceItem> experiences;
  final List<EducationItem> education;

  PortfolioData({
    required this.personalInfo,
    required this.services,
    required this.portfolioItems,
    required this.experiences,
    required this.education,
  });

  factory PortfolioData.fromJson(Map<String, dynamic> json) {
    return PortfolioData(
      personalInfo: PersonalInfo.fromJson(json['personalInfo']),
      services: (json['services'] as List)
          .map((item) => ServiceItem.fromJson(item))
          .toList(),
      portfolioItems: (json['portfolioItems'] as List)
          .map((item) => PortfolioItem.fromJson(item))
          .toList(),
      experiences: (json['experiences'] as List)
          .map((item) => ExperienceItem.fromJson(item))
          .toList(),
      education: (json['education'] as List)
          .map((item) => EducationItem.fromJson(item))
          .toList(),
    );
  }
}

class PersonalInfo {
  final String name;
  final String title;
  final String description;
  final String imageUrl;
  final List<Stat> stats;

  PersonalInfo({
    required this.name,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.stats,
  });

  factory PersonalInfo.fromJson(Map<String, dynamic> json) {
    return PersonalInfo(
      name: json['name'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      stats:
          (json['stats'] as List).map((item) => Stat.fromJson(item)).toList(),
    );
  }
}

class Stat {
  final String value;
  final String label;

  Stat({required this.value, required this.label});

  factory Stat.fromJson(Map<String, dynamic> json) {
    return Stat(
      value: json['value'],
      label: json['label'],
    );
  }
}

class ServiceItem {
  final String title;
  final String description;
  final String icon;

  ServiceItem({
    required this.title,
    required this.description,
    required this.icon,
  });

  factory ServiceItem.fromJson(Map<String, dynamic> json) {
    return ServiceItem(
      title: json['title'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}

class PortfolioItem {
  final String title;
  final String imageUrl;
  final String description;

  PortfolioItem({
    required this.title,
    required this.imageUrl,
    required this.description,
  });

  factory PortfolioItem.fromJson(Map<String, dynamic> json) {
    return PortfolioItem(
      title: json['title'],
      imageUrl: json['imageUrl'],
      description: json['description'],
    );
  }
}

class ExperienceItem {
  final String period;
  final String title;
  final String company;

  ExperienceItem({
    required this.period,
    required this.title,
    required this.company,
  });

  factory ExperienceItem.fromJson(Map<String, dynamic> json) {
    return ExperienceItem(
      period: json['period'],
      title: json['title'],
      company: json['company'],
    );
  }
}

class EducationItem {
  final String period;
  final String degree;
  final String institution;

  EducationItem({
    required this.period,
    required this.degree,
    required this.institution,
  });

  factory EducationItem.fromJson(Map<String, dynamic> json) {
    return EducationItem(
      period: json['period'],
      degree: json['degree'],
      institution: json['institution'],
    );
  }
}
