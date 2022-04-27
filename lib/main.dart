import 'core/theme/theme.dart';
import 'data/dao/message_dao.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'data/dao/user_dao.dart';
import 'app/ui/message_list.dart';
import 'app/ui/screens/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Add Firebase Initialization
  await Firebase.initializeApp();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // Add MultiProviderconst

    return MultiProvider(
      providers: [

        // Add ChangeNotifierProvider<UserDao> here
        ChangeNotifierProvider<UserDao>(
          lazy: false,
          create: (_) => UserDao(),
        ),
        Provider<MessageDao>(
          lazy: false,
          create: (_) => MessageDao(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mensaje',
        theme: ThemeData(primaryColor: kprimary),

        // Add Consumer<UserDao> here
        home: Consumer<UserDao>(
          builder: (context, userDao, child) {
            if (userDao.isLoggedIn()) {
              return const MessageList();
            } else {
              return const Login();
            }
          },
        ),
        // Add closing parenthesis
      ),
    );
  }
}
