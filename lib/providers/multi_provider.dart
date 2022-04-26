import 'package:driver_app/providers/auth_provider.dart';
import 'package:driver_app/providers/user_provider.dart';
import 'package:provider/provider.dart';

var multiProvider = [
  ChangeNotifierProvider<AuthProvider>(
    create: (_) => AuthProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<UserProvider>(
    create: (_) => UserProvider(),
    lazy: true,
  ),
];
