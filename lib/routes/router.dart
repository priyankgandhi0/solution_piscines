import 'package:get/get.dart';
import 'package:solution_piscines/ui/main/details/details_screen/details_screen.dart';
import 'package:solution_piscines/ui/main/history/history_screen.dart';
import 'package:solution_piscines/ui/main/pool_type_screen/pool_type/pool_type_screen.dart';
import '../ui/main/details/test_parameter/test_parameter_screen.dart';
import '../ui/main/home_screen/home_screen.dart';
import '../ui/main/notification/notification_screen.dart';
import '../ui/main/pool_type_screen/pool_type_details/pool_type_details_screen.dart';
import '../ui/main/splash_screen/splash_screen.dart';

class Routes {
  static const String splash = "/splash";
  static const String home = "/home";
  static const String poolType = "/pooltype";
  static const String history = "/history";
  static const String poolTypeDetails = "/poolTypeDetails";
  static const String testParameter = "/testParameter";
  static const String details = "/details";
  static const String notification = "/notification";


  static List<GetPage> pages = [
    GetPage(
        name: Routes.splash,
        page: () =>  SplashScreen(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.home,
        page: () =>  HomeScreen()),
    GetPage(
        name: Routes.poolType,
        page: () =>  PoolType()),
    GetPage(
        name: Routes.history,
        page: () =>  HistoryScreen()),
    GetPage(
        name: Routes.poolTypeDetails,
        page: () =>  PoolTypeDetailsScreen()),
    GetPage(
        name: Routes.testParameter,
        page: () =>  TestParameter()),
    GetPage(
        name: Routes.details,
        page: () =>  DetailsScreen()),
    GetPage(
        name: Routes.notification,
        page: () =>  NotificationScreen()),

  ];
}
