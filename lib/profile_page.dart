import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();

  bool _isUpdated = false; // Состояние для отслеживания обновления

  @override
  void initState() {
    super.initState();

    _nameController.text = 'Chihabeddine Merabet';
    _phoneController.text = '+213666324206';
    _emailController.text = 'chihab0507@gmail.com';
    _birthDateController.text = '05 / 07 / 2002';
  }

  void _updateProfile() {
    setState(() {
      _isUpdated = true; // Меняем состояние при нажатии кнопки
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
                children: [
                const SizedBox(height: 25), // Отступ сверху

            // Заголовок Profile
            const Text(
              'Profile',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFFF57C00),
              ),
            ),

            const SizedBox(height: 15),

            // Profile Photo с вашим изображением
            Stack(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey[300]!,
                      width: 2,
                    ),
                  ),
                  child: const CircleAvatar(
                    radius: 58,
                    backgroundImage: AssetImage('assets/images/img_1.png'),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            // Full Name
            _buildProfileItem(
              title: 'Full Name',
              value: 'Chihabeddine Merabet',
            ),
            const SizedBox(height: 25),

            // Phone Number
            _buildProfileItem(
              title: 'Phone Number',
              value: '+213666324206',
            ),
            const SizedBox(height: 25),

            // Email
            _buildProfileItem(
              title: 'Email',
              value: 'chihab0507@gmail.com',
            ),
            const SizedBox(height: 25),

            // Date Of Birth
            _buildProfileItem(
              title: 'Date Of Birth',
              value: '05 / 07 / 2002',
            ),

            // Update Profile Button
            const SizedBox(height: 50),
            SizedBox(width: 180,
              height: 50,
              child: ElevatedButton(
                onPressed: _updateProfile,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // Кнопка остается оранжевой
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Update Profile',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
                ],
            ),
        ),
    );
  }

  Widget _buildProfileItem({
    required String title,
    required String value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.grey[800], // Заголовок остается серым
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          decoration: BoxDecoration(
            color: _isUpdated ? Colors.orange[100] : Colors.grey[300], // Фон меняется на светло-оранжевый
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _isUpdated ? Colors.orange : Colors.grey[300]!, // Рамка меняется на оранжевую
              width: 1.0,
            ),
          ),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black87, // Текст остается черным
            ),
          ),
        ),
      ],
    );
  }


  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _birthDateController.dispose();
    super.dispose();
  }
}
