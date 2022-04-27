import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/dao/user_dao.dart';
import '../../widgets/app_button.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userDao = Provider.of<UserDao>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Mensaje',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Form(
          key: _formKey,

          // Add Column & Email
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(height: 80),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: 'Email Address',
                      ),
                      autofocus: false,
                      keyboardType: TextInputType.emailAddress,
                      textCapitalization: TextCapitalization.none,
                      autocorrect: false,
                      controller: _emailController,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Email Required';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),

              // Add Password
              Row(
                children: [
                  const SizedBox(height: 20),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(), hintText: 'Password'),
                      autofocus: false,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      textCapitalization: TextCapitalization.none,
                      autocorrect: false,
                      controller: _passwordController,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Password Required';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const Spacer(),

              // Add Buttons
              Row(
                children: [
                  const SizedBox(height: 20),
                  Expanded(
                    child: AppButton(
                      btnText: 'Login',
                      btnColor: Colors.blueAccent.shade100,
                      onTap: () {
                        userDao.login(
                            _emailController.text,
                            _passwordController.text
                        );
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(height: 20),
                  Expanded(
                    child: AppButton(
                      btnText: 'Sign Up',
                      btnColor: Colors.blueAccent.shade100,
                      onTap: () {
                        userDao.signup(
                            _emailController.text,
                            _passwordController.text
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 60),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
