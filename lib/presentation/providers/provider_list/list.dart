import 'package:provider/provider.dart';
import 'package:we_care/presentation/providers/provider_list/providers_export.dart';

class Providers {
  static List<ChangeNotifierProvider> providers = [
    ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
    ChangeNotifierProvider<FormsProvider>(create: (_) => FormsProvider()),
    ChangeNotifierProvider<OrderProvider>(create: (_) => OrderProvider()),
    ChangeNotifierProvider<ProfileProvider>(create: (_) => ProfileProvider()),
    ChangeNotifierProvider<SharedPreferenceProvider>(
        create: (_) => SharedPreferenceProvider()),
    ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
    ChangeNotifierProvider<FeedProvider>(create: (_) => FeedProvider()),
    ChangeNotifierProvider<ServicesProvider>(create: (_) => ServicesProvider()),
    ChangeNotifierProvider<ChildrenProvider>(create: (_) => ChildrenProvider()),
    ChangeNotifierProvider<AddressProvider>(create: (_) => AddressProvider()),
    ChangeNotifierProvider<ContactProvider>(create: (_) => ContactProvider()),
    ChangeNotifierProvider<AboutUsProvider>(create: (_) => AboutUsProvider()),
    ChangeNotifierProvider<FAQProvider>(create: (_) => FAQProvider()),
    ChangeNotifierProvider<TermsProvider>(create: (_) => TermsProvider()),
    ChangeNotifierProvider<NotificationProvider>(create: (_) => NotificationProvider()),
  ];
}
