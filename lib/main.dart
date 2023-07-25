import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/checkOut/checkout_screen.dart';
import 'screens/forgotPassword/create_new_password_screen.dart';
import 'screens/forgotPassword/forgot_password_screen.dart';
import 'screens/forgotPassword/otp_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/intro/intro_screen.dart';
import 'screens/intro/intro_slider_screen.dart';
import 'screens/intro/splash_screen.dart';
import 'screens/items/chair/chair_home.dart';
import 'screens/items/cubboard/cubboard_home.dart';
import 'screens/items/kitchen/kitchen_home.dart';
import 'screens/items/lamp/lamp_home.dart';
import 'screens/items/sofa/sofa.dart';
import 'screens/items/table/table_home.dart';
import 'screens/items/vase/vase_home.dart';
import 'screens/mostPopular/most_popular.dart';
import 'screens/cart/cart_screen.dart';
import 'screens/navigation.dart';
import 'screens/orders/order_screen.dart';
import 'screens/setting/address/address_screen.dart';
import 'screens/setting/language/language_screen.dart';
import 'screens/setting/payment/payment_screen.dart';
import 'screens/setting/privacy/privacy_policy_screen.dart';
import 'screens/setting/profile/profile_screen.dart';
import 'screens/setting/security/security_screen.dart';
import 'screens/signIn/login_screen.dart';
import 'screens/signUp/create_new_pin_screen.dart';
import 'screens/signUp/create_user_profile_screen.dart';
import 'screens/signUp/register_screen.dart';
import 'screens/signUp/welcome_screen.dart';
import 'screens/specialOffer/special_offer.dart';

import 'screens/setting/notification/notification_screen.dart';
import 'screens/setting/profile/edit_profile_screen.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SafeArea(child: WelcomeScreen()),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: ((context) => const SplashScreen()),
        IntroScreen.routeName: ((context) => const IntroScreen()),
        IntroSliderScreen.routeName: (context) => const IntroSliderScreen(),
        WelcomeScreen.routeName: ((context) => const WelcomeScreen()),
        RegisterScreen.routeName: ((context) => const RegisterScreen()),
        CreateUserProfileScreen.routeName: ((context) =>
            const CreateUserProfileScreen()),
        CreateNewPinScreen.routeName: ((context) => const CreateNewPinScreen()),
        LoginScreen.routeName: ((context) => const LoginScreen()),
        ForgotPasswordScreen.routeName: ((context) =>
            const ForgotPasswordScreen()),
        OTPScreen.routeName: ((context) => const OTPScreen()),
        CreateNewPasswordScreen.routeName: ((context) =>
            const CreateNewPasswordScreen()),
        MyNavigation.routeName: ((context) => const MyNavigation()),
        HomeScreen.routeName: ((context) => HomeScreen()),
        SpecialOfferScreen.routeName: ((context) => const SpecialOfferScreen()),
        MostpopularScreen.routeName: ((context) => const MostpopularScreen()),
        SofaHomeScreen.routeName: ((context) => SofaHomeScreen()),
        ChairHomeScreen.routeName: ((context) => ChairHomeScreen()),
        CubboardHomeScreen.routeName: ((context) => CubboardHomeScreen()),
        KitchenHomeScreen.routeName: ((context) => KitchenHomeScreen()),
        LampHomeScreen.routeName: ((context) => LampHomeScreen()),
        TableHomeScreen.routeName: ((context) => TableHomeScreen()),
        VaseHomeScreen.routeName: ((context) => VaseHomeScreen()),
        EditProfileScreen.routeName: ((context) => const EditProfileScreen()),
        ProfileScreen.routeName: ((context) => const ProfileScreen()),
        AddressScreen.routeName: ((context) => const AddressScreen()),
        NotificationScreen.routeName: ((context) => const NotificationScreen()),
        PaymentScreen.routeName: ((context) => const PaymentScreen()),
        SecurityScreen.routeName: ((context) => const SecurityScreen()),
        LanguageScreen.routeName: ((context) => const LanguageScreen()),
        PrivacyPolicyScreen.routeName: ((context) =>
            const PrivacyPolicyScreen()),
        MyCardScreen.routeName: ((context) => const MyCardScreen()),
        CheckOutScreen.routeName: ((context) => const CheckOutScreen()),
        OrderScreen.routeName: ((context) => const OrderScreen()),
      },
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle.dark, // 2
          ),
          fontFamily: "Montserrat",
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.transparent)),
    );
  }
}
