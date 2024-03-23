import 'package:flutter/material.dart';
import 'package:kembang_belor_apps/features/home/domain/entities/tourism.dart';
import 'package:kembang_belor_apps/features/home/presentation/pages/detail_facility_page.dart';
import 'package:kembang_belor_apps/features/home/presentation/pages/detail_tourism.dart';
import 'package:kembang_belor_apps/features/home/presentation/pages/facility_page.dart';
import 'package:kembang_belor_apps/features/home/presentation/pages/main_page.dart';
import 'package:kembang_belor_apps/features/payment/domain/entity/selected_tourism_payment.dart';
import 'package:kembang_belor_apps/features/payment/presentation/pages/payment.dart';

class AppRoute {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const MainPage());
      case '/facility':
        return _materialRoute(const FacilitiesPage());
      case '/detail_facility':
        return _materialRoute(const DetailFacility());
      case '/detail_tourism':
        final args = settings.arguments as TourismEntity;
        return _materialRoute(DetailTourims(entity: args));
      case '/payment':
        final args = settings.arguments as PaymentTourism;
        return _materialRoute(PaymentPage(
          selectedTourismPayment: args,
        ));
      default:
        return _materialRoute(const MainPage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
