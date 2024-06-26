import 'package:flutter/material.dart';
import 'package:kembang_belor_apps/features/auth/presentation/pages/login.dart';
import 'package:kembang_belor_apps/features/auth/presentation/pages/registration.dart';
import 'package:kembang_belor_apps/features/event/domain/entities/event.dart';
import 'package:kembang_belor_apps/features/event/domain/entities/vendor_collab.dart';
import 'package:kembang_belor_apps/features/event/presentation/pages/detail_collab.dart';
import 'package:kembang_belor_apps/features/event/presentation/pages/detail_event.dart';
import 'package:kembang_belor_apps/features/event/presentation/pages/detail_history_collab.dart';
import 'package:kembang_belor_apps/features/event/presentation/pages/event.dart';
import 'package:kembang_belor_apps/features/event/presentation/pages/history_vendor_collab.dart';
import 'package:kembang_belor_apps/features/home/domain/entities/recently_update.dart';
import 'package:kembang_belor_apps/features/home/domain/entities/tourism.dart';
import 'package:kembang_belor_apps/features/home/presentation/pages/detail_facility_page.dart';
import 'package:kembang_belor_apps/features/home/presentation/pages/detail_tourism.dart';
import 'package:kembang_belor_apps/features/home/presentation/pages/facility_page.dart';
import 'package:kembang_belor_apps/features/home/presentation/pages/main_page.dart';
import 'package:kembang_belor_apps/features/payment/domain/entity/selected_tourism_payment.dart';
import 'package:kembang_belor_apps/features/payment/domain/entity/ticket.dart';
import 'package:kembang_belor_apps/features/payment/presentation/pages/detail_ticket.dart';
import 'package:kembang_belor_apps/features/payment/presentation/pages/my_ticket.dart';
import 'package:kembang_belor_apps/features/payment/presentation/pages/payment.dart';
import 'package:kembang_belor_apps/features/payment/presentation/pages/payment_history.dart';
import 'package:kembang_belor_apps/features/payment/presentation/pages/receipt.dart';
import 'package:kembang_belor_apps/features/payment/presentation/pages/saved_ticket.dart';

class AppRoute {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const MainPage());
      case '/login':
        return _materialRoute(const LoginPage());
      case '/registration':
        return _materialRoute(const RegistrationPage());
      case '/home':
        return _materialRoute(const MainPage());
      case '/facility':
        return _materialRoute(const FacilitiesPage());
      case '/detail_facility':
        final args = settings.arguments as RecentlyFacilityEntity;
        return _materialRoute(DetailFacility(
          entity: args,
        ));
      case '/detail_tourism':
        final args = settings.arguments as TourismEntity;
        return _materialRoute(DetailTourims(entity: args));
      case '/receipt':
        return _materialRoute(const ReceiptPage());
      case '/payment':
        final args = settings.arguments as PaymentTourism;
        return _materialRoute(PaymentPage(
          selectedTourismPayment: args,
        ));
      case '/event':
        return _materialRoute(const EventPage());
      case '/detail_event':
        final args = settings.arguments as EventEntity;
        return _materialRoute(DetailEventPage(
          entity: args,
        ));
      case '/saved_ticket':
        return _materialRoute(const SavedTicketPage());
      case '/riwayat_pembayaran':
        return _materialRoute(const PaymentHistoryPage());
      case '/tiket_saya':
        return _materialRoute(const MyTicketPage());
      case "/detail_ticket":
        final args = settings.arguments as Map<String, dynamic>;
        return _materialRoute(DetailTicketPage(
          entity: args['entity'] as TicketEntity,
          isFromTicket: args['isFromTicket'] as bool,
        ));
      case '/history_collab':
        return _materialRoute(const HistoryVendorCollabPage());
      case '/detail_history_collab':
        final args = settings.arguments as VendorCollabEntity;
        return _materialRoute(DetailHistoryVendorCollabPage(
          entity: args,
        ));
      case '/detail_vendor':
        final args = settings.arguments as EventEntity;
        return _materialRoute(DetailCollabPage(
          entity: args,
        ));

      default:
        return _materialRoute(const MainPage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
