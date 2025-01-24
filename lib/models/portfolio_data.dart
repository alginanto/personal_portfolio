// models/portfolio_data.dart

class PortfolioData {
  final PersonalInfo personalInfo;
  final List<ServiceItem> services;
  final List<PortfolioItem> portfolioItems;
  final List<ExperienceItem> experiences;
  final List<EducationItem> education;
  final List<SupportedApps> supportedApps;

  PortfolioData(
      {required this.personalInfo,
      required this.services,
      required this.portfolioItems,
      required this.experiences,
      required this.education,
      required this.supportedApps});

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
      supportedApps: (json['supportedApps'] as List)
          .map((item) => SupportedApps.fromJson(item))
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
  final String gitUrl;
  final String linkedinUrl;
  final String instagramUrl;

  PersonalInfo(
      {required this.name,
      required this.title,
      required this.description,
      required this.imageUrl,
      required this.stats,
      required this.gitUrl,
      required this.linkedinUrl,
      required this.instagramUrl});

  factory PersonalInfo.fromJson(Map<String, dynamic> json) {
    return PersonalInfo(
        name: json['name'],
        title: json['title'],
        description: json['description'],
        imageUrl: json['imageUrl'],
        stats:
            (json['stats'] as List).map((item) => Stat.fromJson(item)).toList(),
        gitUrl: json['gitUrl'],
        linkedinUrl: json['linkedinUrl'],
        instagramUrl: json['instagramUrl']);
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
  final String imageUrl;

  ServiceItem(
      {required this.title,
      required this.description,
      required this.icon,
      required this.imageUrl});

  factory ServiceItem.fromJson(Map<String, dynamic> json) {
    return ServiceItem(
        title: json['title'],
        description: json['description'],
        icon: json['icon'],
        imageUrl: json['imageUrl']);
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

class SupportedApps {
  final String appUrlaAndroid;
  final String appUrlIos;
  final String appImage;

  SupportedApps({
    required this.appUrlaAndroid,
    required this.appUrlIos,
    required this.appImage,
  });

  factory SupportedApps.fromJson(Map<String, dynamic> json) {
    return SupportedApps(
      appUrlaAndroid: json['appUrlaAndroid'],
      appUrlIos: json['appUrlIos'],
      appImage: json['appImage'],
    );
  }
}
