import 'package:flutter/material.dart';
import 'package:twitter/components/button.dart';
import 'package:twitter/components/loading_circle.dart';
import 'package:twitter/components/text_field.dart';
import 'package:twitter/services/auth/auth_service.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //auth servislerine eriş
  final _auth = AuthService();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //giriş metodu
  void login() async {
    showLoadingCircle(context);

    try {
      await _auth.loginEmailPassword(
        emailController.text,
        passwordController.text,
      );
      if (mounted) hideLoadingCircle(context);
    } catch (e) {
      if (mounted) hideLoadingCircle(context);
      print(e.toString());

      if (mounted)
        showDialog(
          context: context,
          builder: (context) => AlertDialog(title: Text(e.toString())),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),

                Image.asset("assets/twix.png", height: 80),

                const SizedBox(height: 30),

                Text(
                  "Tekrar Hoş Geldiniz!",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),

                const SizedBox(height: 25),

                // e-posta
                myTextField(
                  controller: emailController,
                  hintText: "E-posta",
                  obscureText: false,
                ),

                const SizedBox(height: 12),

                // şifre
                myTextField(
                  controller: passwordController,
                  hintText: "Şifre",
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Şifrenizi mi unuttunuz?",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                MyButton(onTap: login, text: "Giriş Yap"),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Üye değil misiniz?",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(width: 7),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        "Hesap oluşturun!",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
