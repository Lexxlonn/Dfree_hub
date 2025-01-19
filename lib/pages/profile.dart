import 'package:dfree_hub/pages/profile_edit.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3D7D6),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              const SizedBox(height: 60),
              const Text(
                'Profile',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF122C50),
                ),
                textAlign: TextAlign.center,
              ),
              Center(
                child: Column(
                  children: [
                    SizedBox(height: 24),
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.grey[300],
                          child: Icon(Icons.person,
                              size: 40, color: Colors.grey[600]),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProfileEdit(),
                                ),
                              );
                            },
                            child: Container(
                              width: 24, // Adjust size as needed
                              height: 24,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                'lib/assets/Edit.png', // Path to the edit icon
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60),
              _buildFormField('Name', _nameController),
              _buildFormField('Email Address', _emailController),
              _buildFormField('Phone', _phoneController),
              _buildFormField('Age', _ageController),
              _buildFormField('DOB', _dobController),
              _buildFormField('Address', _addressController),
            ],
          ),
        ),
      ),
    );
  }

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _ageController = TextEditingController();
  final _dobController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    final response = await Supabase.instance.client
        .from('user')
        .select()
        .eq('id', '24') // Replace with the actual user ID
        .single();

    setState(() {
      _nameController.text = response['fname'] + ' ' + response['lname'];
      _emailController.text = response['email_id'];
      _phoneController.text = response['phone'].toString();
      _ageController.text = response['age'].toString();
      _dobController.text = response['dob'];
      _addressController.text = response['address'];
    });
  }
}

Widget _buildFormField(String label, TextEditingController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color(0xFF122C50),
        ),
      ),
      const SizedBox(height: 8),
      TextFormField(
        controller: controller,
        decoration: const InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      ),
      const SizedBox(height: 16),
    ],
  );
}
