import 'package:flutter/material.dart';
import 'package:twitter/components/button.dart';
import 'package:twitter/components/text_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController rpasswordController = TextEditingController();

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
                  obscureText: false,
                ),

               

                const SizedBox(height: 25),

                MyButton(onTap: () {}, text: "Giriş Yap"),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Hesabınız var mı??",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(width: 7),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Kayıt Ol!",
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
