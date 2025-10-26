import 'package:attendia/profile_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                        key: _formKey,
                        child: Column(
                            children: [
                            const SizedBox(height: 40),

                        // Логотип
                        Image.asset(
                          'assets/images/img.png',
                          width: 309,
                          height: 76,
                        ),
                        const SizedBox(height: 90),

                        // Заголовок
                        const Text(
                          'Welcome back! Glad to see you, Again!',
                          style: TextStyle(
                            fontSize: 37,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 30),

                        // Поле почты
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 9.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter your email',
                              hintStyle: TextStyle(
                                  color: Colors.grey[500]
                              ),
                              filled: true,
                              fillColor: Colors.grey[100], // Подберите цвет
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color:Colors.grey[200]!,width: 1.0), // Убираем стандартную рамку
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),

                        // Поле пароля
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 9.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter your password',
                              hintStyle: TextStyle(
                                color: Colors.grey[500],
                              ),
                              filled: true,
                              fillColor: Colors.grey[100], // Подберите цвет
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color:Colors.grey[200]!,width: 1.0), // Убираем стандартную рамку
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 0.5),

                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 9.0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.end, // Выравнивание по правому краю
                                children: [
                                TextButton(
                                onPressed: () {
                            // Действие при нажатии
                            print('Забыли пароль?');
                    },
                        child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 16,),
                        ),
                                ),
                                ],
                            ),
                        ),
                              const SizedBox(height: 40),

                              // Кнопка входа
                              _isLoading
                                  ? const CircularProgressIndicator()
                                  : SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: _loginUser,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFF57C00),
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),

                            ],
                        ),
                    ),
                ),
            ),
        ),
    );
  }

  void _loginUser() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Имитация загрузки (в реальном приложении здесь будет API запрос)
      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        _isLoading = false;
      });

      final email = _emailController.text;
      final password = _passwordController.text;

      print('Вход: $email, Пароль: $password');

      // Успешный вход - переход на главный экран
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const ProfilePage(), // Переход на главную страницу
        ),
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
