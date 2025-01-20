// services/portfolio_service.dart

import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/portfolio_data.dart';

class PortfolioService {
  // For local JSON file
  Future<PortfolioData> loadPortfolioData() async {
    try {
      // Load from local assets
      final String jsonString = await rootBundle.loadString('assets/portfolio_data.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      return PortfolioData.fromJson(jsonData);
    } catch (e) {
      throw Exception('Failed to load portfolio data: $e');
    }
  }

  // For future API implementation
  /*
  Future<PortfolioData> fetchPortfolioData() async {
    try {
      final response = await http.get(Uri.parse('YOUR_API_ENDPOINT'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        return PortfolioData.fromJson(jsonData);
      } else {
        throw Exception('Failed to load portfolio data');
      }
    } catch (e) {
      throw Exception('Failed to fetch portfolio data: $e');
    }
  }
  */
}