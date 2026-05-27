import 'package:get/get.dart';
import '../modules/create_account/create_account_binding.dart';
import '../modules/create_account/create_account_view.dart';
import '../modules/delete_account_policy/delete_account_policy_binding.dart';
import '../modules/delete_account_policy/delete_account_policy_view.dart';
import '../modules/delete_account_request/delete_account_request_binding.dart';
import '../modules/delete_account_request/delete_account_request_view.dart';
import '../modules/home/meet_the_team_view.dart';
import '../modules/terms_conditions/terms_conditions_binding.dart';
import '../modules/terms_conditions/terms_conditions_view.dart';
import 'app_routes.dart';
import '../modules/splash/splash_binding.dart';
import '../modules/splash/splash_view.dart';
import '../modules/home/home_binding.dart';
import '../modules/home/home_view.dart';
import '../modules/settings/settings_binding.dart';
import '../modules/settings/settings_view.dart';
import '../modules/services/services_binding.dart';
import '../modules/services/services_view.dart';
import '../modules/ama/ama_binding.dart';
import '../modules/ama/ama_view.dart';
import '../modules/ama/ask_ama_binding.dart';
import '../modules/ama/ask_ama_view.dart';
import '../modules/portfolio/portfolio_binding.dart';
import '../modules/portfolio/portfolio_view.dart';
import '../modules/payment_billing/payment_billing_binding.dart';
import '../modules/payment_billing/payment_billing_view.dart';
import '../modules/privacy_policy/privacy_policy_binding.dart';
import '../modules/privacy_policy/privacy_policy_view.dart';
import '../modules/notification/notification_binding.dart';
import '../modules/notification/notification_view.dart';
import '../modules/login/login_binding.dart';
import '../modules/login/login_view.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () =>  HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: Routes.SERVICES,
      page: () => const ServicesView(),
      binding: ServicesBinding(),
    ),
    GetPage(
      name: Routes.AMA,
      page: () => const AmaView(),
      binding: AmaBinding(),
    ),
    GetPage(
      name: Routes.ASK_AMA,
      page: () => const AskAmaView(),
      binding: AskAmaBinding(),
    ),
    GetPage(
      name: Routes.TERMS_CONDITIONS,
      page: () => const TermsConditionsView(),
      binding: TermsConditionsBinding(),
    ),
    GetPage(
      name: Routes.DELETE_ACCOUNT_POLICY,
      page: () => const DeleteAccountPolicyView(),
      binding: DeleteAccountPolicyBinding(),
    ),
    GetPage(
      name: Routes.DELETE_ACCOUNT_REQUEST,
      page: () => const DeleteAccountRequestView(),
      binding: DeleteAccountRequestBinding(),
    ),
    GetPage(
      name: Routes.MEET_THE_TEAM,
      page: () => const MeetTheTeamView(),
    ),
    GetPage(
      name: Routes.PORTFOLIO,
      page: () => const PortfolioView(),
      binding: PortfolioBinding(),
    ),
    GetPage(
      name: Routes.PAYMENT_BILLING,
      page: () => const PaymentBillingView(),
      binding: PaymentBillingBinding(),
    ),
    GetPage(
      name: Routes.PRIVACY_POLICY,
      page: () => const PrivacyPolicyView(),
      binding: PrivacyPolicyBinding(),
    ),
    GetPage(
      name: Routes.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.CREATE_ACCOUNT,
      page: () => const CreateAccountView(),
      binding: CreateAccountBinding(),
    ),
  ];
}
