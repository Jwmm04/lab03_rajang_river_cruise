import 'package:flutter/foundation.dart';
import '../models/cruise_destination.dart';

class CruiseBookingViewModel extends ChangeNotifier {
  final CruiseDestination destination = const CruiseDestination(
    name: 'Rajang River Cruise',
    location: 'Sibu, Sarawak',
    description:
    'Explore the Rajang River and discover the scenery '
        'and local heritage of Sibu, Sarawak.',
    imagePath: 'assets/images/rajang_river.jpg',
    initialStarCount: 43,
  );

  int _starCount = 43;
  DateTime? _selectedDate;
  String _selectedPackage = 'Private River Cruise';
  bool _isDarkMode = false;

  final List<String> packages = [
    'Private River Cruise',
    'Sunset Cruise',
    'Sunrise Cruise',
    'Rural Cruise',
    'SMI Park Cruise',
  ];

  int get starCount => _starCount;
  DateTime? get selectedDate => _selectedDate;
  String get selectedPackage => _selectedPackage;
  bool get isDarkMode => _isDarkMode;

  void incrementStarCount() {
    _starCount++;
    notifyListeners();
  }

  void setVisitDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  void setPackage(String package) {
    _selectedPackage = package;
    notifyListeners();
  }

  void toggleTheme(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }
}