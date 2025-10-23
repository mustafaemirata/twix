import 'package:flutter/material.dart';
import 'package:twitter/components/button.dart';
import 'package:twitter/components/loading_circle.dart';
import 'package:twitter/components/text_field.dart';
import 'package:twitter/services/auth/auth_service.dart';
import 'package:twitter/services/auth/database/database_service.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //autha eriş
  final _auth = AuthService();
  final _db = DatabaseService();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rpasswordController = TextEditingController();

  void register() async {
    if (passwordController.text == rpasswordController.text) {
      showLoadingCircle(context);
      try {
        await _auth.registerEmailPassword(
          emailController.text,
          passwordController.text,
        );
        if (mounted) hideLoadingCircle(context);

        //kaydı yap kaydet
        await _db.seveUserInfoFirebase(
          name: nameController.text,
          email: emailController.text,
        );
      } catch (e) {
        if (mounted) hideLoadingCircle(context);

        if (mounted) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(title: Text(e.toString())),
          );
        }
      }
    } else {
      showDialog(
        context: context,
        builder: (context) =>
            const AlertDialog(title: Text("Şifreler uyuşmuyor!")),
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
                  "Hadi hesap oluşturalım!!",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),

                const SizedBox(height: 25),
                // isim
                myTextField(
                  controller: nameController,
                  hintText: "Kullanıcı adı",
                  obscureText: false,
                ),

                const SizedBox(height: 12),

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
                // e-posta
                myTextField(
                  controller: rpasswordController,
                  hintText: "Şifre (Tekrar)",
                  obscureText: true,
                ),

                const SizedBox(height: 25),

                MyButton(onTap: register, text: "Kayıt Ol"),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Hesabınız var mı?",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(width: 7),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        "Giriş Yap!",
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
