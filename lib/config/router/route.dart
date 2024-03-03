import 'package:flutter/material.dart';
import 'package:kembang_belor_apps/pages/detail_facility_page.dart';
import 'package:kembang_belor_apps/pages/facility_page.dart';
import 'package:kembang_belor_apps/pages/main_page.dart';

class AppRoute {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const MainPage());
      case '/facility':
        return _materialRoute(const FacilitiesPage());
      case '/detail_facility':
        return _materialRoute(const DetailFacility());
      default:
        return _materialRoute(const MainPage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
