import 'package:get/get.dart';
import 'package:mandirwiki/bindings/blog_binding.dart';
import 'package:mandirwiki/bindings/home_screen_controller.dart';
import 'package:mandirwiki/bindings/mandir_detail_bindings.dart';
import 'package:mandirwiki/bindings/my_booking_binding.dart';
import 'package:mandirwiki/bindings/my_locker_binding.dart';
import 'package:mandirwiki/bindings/my_plan_binding.dart';
import 'package:mandirwiki/bindings/otp_screen_binding.dart';
import 'package:mandirwiki/bindings/login_screen_binding.dart';
import 'package:mandirwiki/bindings/registration_binding.dart';
import 'package:mandirwiki/bindings/rent_locker_binding.dart';
import 'package:mandirwiki/bindings/scan_qr_bindings.dart';
import 'package:mandirwiki/bindings/splash_screen_bindings.dart';
import 'package:mandirwiki/bindings/vr_darshan_bindings.dart';
import 'package:mandirwiki/bindings/wishlist_bindings.dart';
import 'package:mandirwiki/bindings/yatri_pack_bindings.dart';
import 'package:mandirwiki/screen/blog_bottom_nav_bar.dart';
import 'package:mandirwiki/screen/bottom_navigation.dart';
import 'package:mandirwiki/screen/home_page.dart';
import 'package:mandirwiki/screen/mandir_details.dart';
import 'package:mandirwiki/screen/modify_booking_page.dart';
import 'package:mandirwiki/screen/my_booking.dart';
import 'package:mandirwiki/screen/my_locker.dart';
import 'package:mandirwiki/screen/my_plans_screen.dart';
import 'package:mandirwiki/screen/my_wishlist.dart';
import 'package:mandirwiki/screen/otp_screen.dart';
import 'package:mandirwiki/screen/login_screen.dart';
import 'package:mandirwiki/screen/rent_a_locker_detail.dart';
import 'package:mandirwiki/screen/rent_locker.dart';
import 'package:mandirwiki/screen/scan_qr_screen.dart';
import 'package:mandirwiki/screen/splash_Screen.dart';
import 'package:mandirwiki/screen/user_detais.dart';
import 'package:mandirwiki/screen/vr_darshan_screen.dart';
import 'package:mandirwiki/screen/yatri_pack_screen.dart';
import 'package:mandirwiki/util/routes/routes_name.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RouteName.splash_screen,
          page: () => SplashScreen(),
          transition: Transition.rightToLeft,
          binding: SplashScreenBinding(),
        ),
        GetPage(
          name: RouteName.login_screen,
          page: () => LoginScreen(),
          transition: Transition.rightToLeft,
          binding: PhoneNumberBinding(),
        ),
        GetPage(
          name: RouteName.otp_screen,
          page: () => OtpScreen(),
          transition: Transition.rightToLeft,
          binding: OTPBinding(),
        ),
        GetPage(
          name: RouteName.bottom_navigation,
          page: () => BottomNavigation(),
          transition: Transition.rightToLeft,
          binding: HomeScreenBinding(),
        ),
        GetPage(
          name: RouteName.registration_screen,
          page: () => UserDetails(),
          transition: Transition.rightToLeft,
          binding: RegistrationBinding(),
        ),
        GetPage(
          name: RouteName.home_screen,
          page: () => HomePage(),
          transition: Transition.rightToLeft,
          binding: HomeScreenBinding(),
        ),
        GetPage(
          name: RouteName.scan_qr,
          page: () => ScanQRScreen(),
          transition: Transition.rightToLeft,
          binding: ScanQRBinding(),
        ),
        GetPage(
          name: RouteName.yatri_pack,
          page: () => YatriPackScreen(),
          transition: Transition.rightToLeft,
          binding: YatriPackBinding(),
        ),
        GetPage(
          name: RouteName.wishlist,
          page: () => MyWishlist(),
          transition: Transition.rightToLeft,
          binding: WishlistBindings(),
        ),
        GetPage(
          name: RouteName.my_plan,
          page: () => MyPlansScreen(),
          transition: Transition.rightToLeft,
          binding: MyPlanBinding(),
        ),
        GetPage(
          name: RouteName.vr_darshan,
          page: () => VrDarshanScreen(),
          transition: Transition.rightToLeft,
          binding: VrDarshanBinding(),
        ),
        GetPage(
          name: RouteName.my_booking,
          page: () => MyBooking(),
          transition: Transition.rightToLeft,
          binding: MyBookingBinding(),
        ),
        GetPage(
          name: RouteName.modify_booking_page,
          page: () => ModifyBookingScreen(),
          transition: Transition.rightToLeft,
          binding: RentLockerBinding(),
        ),
        GetPage(
          name: RouteName.rent_a_locker_detail,
          page: () => RentLockerDetail(),
          transition: Transition.rightToLeft,
          binding: RentLockerBinding(),
        ),
        GetPage(
          name: RouteName.my_locker,
          page: () => MyLocker(),
          transition: Transition.rightToLeft,
          binding: MyLockerBinding(),
        ),
        GetPage(
          name: RouteName.mandir_detail,
          page: () => MandirDetails(),
          transition: Transition.rightToLeft,
          binding: MandirDetailBindings(),
        ),
        GetPage(
          name: RouteName.blog,
          page: () => BlogBottomNavBar(),
          transition: Transition.rightToLeft,
          binding: BlogBinding(),
        ),
      ];
}
//arrived_screen
