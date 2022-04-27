import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import '../data/user_dao.dart';
import 'app/ui/message_list.dart';
import 'app/ui/login.dart';

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

    // Add MultiProvider
    return MultiProvider(
      providers: [

        // Add ChangeNotifierProvider<UserDao> here
        ChangeNotifierProvider<UserDao>(
          lazy: false,
          create: (_) => UserDao(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mensaje',
        theme: ThemeData(primaryColor: const Color(0xFF3D814A)),

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
        // TODO: Add closing parenthesis
      ),
    );
  }
}
