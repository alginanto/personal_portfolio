import 'dart:io';

import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:portfolio/models/portfolio_data.dart';
import 'package:portfolio/pages/contact/contact_page.dart';
import 'package:portfolio/pages/drawer/drawer_page.dart';
import 'package:portfolio/pages/hero/hero_page.dart';
import 'package:portfolio/pages/portfolio/portfolio_page.dart';
import 'package:portfolio/pages/resume/resume_page.dart';
import 'package:portfolio/pages/service/service_page.dart';
import 'package:portfolio/services/portfolio_service.dart';
import 'package:portfolio/widget/responsive_navbar.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'dart:html' as html;

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  final PortfolioService _portfolioService = PortfolioService();
  PortfolioData? _portfolioData;
  bool _isLoading = true;

  final List<String> navItems = [
    'HOME',
    'SERVICES',
    'PORTFOLIO',
    'RESUME',
    'CONTACT'
  ];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final data = await _portfolioService.loadPortfolioData();
      setState(() {
        _portfolioData = data;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      // Handle error appropriately
    }
  }

  void scrollToIndex(int index) {
    itemScrollController.scrollTo(
      index: index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
    );
  }

  void handleDownloadCV() async {
    const String pdfUrl = 'assets/pdf/Algin_Anto.pdf';
    final anchor = html.AnchorElement(href: pdfUrl)
      ..setAttribute("download", "Algin_Anto.pdf")
      ..setAttribute('target', '_blank');
    html.document.body?.append(anchor);
    anchor.click();
    anchor.remove();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (_portfolioData == null) {
      return const Scaffold(
        body: Center(
          child: Text('Failed to load portfolio data'),
        ),
      );
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: ResponsiveNavbar(
          navItems: navItems,
          onItemSelected: scrollToIndex,
          onDownloadCV: handleDownloadCV,
        ),
      ),
      endDrawer: NavDrawer(
        navItems: navItems,
        onItemSelected: scrollToIndex,
        onDownloadCV: handleDownloadCV,
      ),
      body: ScrollablePositionedList.builder(
        itemCount: 5,
        itemScrollController: itemScrollController,
        itemPositionsListener: itemPositionsListener,
        itemBuilder: (context, index) {
          switch (index) {
            case 0:
              return HeroPage(info: _portfolioData!.personalInfo);
            case 1:
              return ServicePage(services: _portfolioData!.services);
            case 2:
              return PortfolioPage(
                  portfolioItems: _portfolioData!.portfolioItems);
            case 3:
              return ResumePage(
                  experiences: _portfolioData!.experiences,
                  education: _portfolioData!.education);

            case 4:
              return const ContactPage();
            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
