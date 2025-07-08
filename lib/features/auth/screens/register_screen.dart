import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _dob = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _whatsapp = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000, 1, 1),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      _dob.text = DateFormat('yyyy-MM-dd').format(picked);
    }
  }

  void _onRegister() {
    if (_formKey.currentState!.validate()) {
      // TODO: Proses register
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Register berhasil!')));
      Navigator.pop(context); // Balik ke login
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: ... (optional)
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 16),
              Center(
                child: Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Nama lengkap
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Nama Lengkap"),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: _name,
                      decoration: _inputDecoration(),
                      validator:
                          (v) =>
                              v == null || v.isEmpty
                                  ? "Nama wajib diisi"
                                  : null,
                    ),
                    const SizedBox(height: 16),
                    // Tanggal Lahir
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Tanggal Lahir"),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: _dob,
                      readOnly: true,
                      onTap: _pickDate,
                      decoration: _inputDecoration(hint: "yyyy-mm-dd"),
                      validator:
                          (v) =>
                              v == null || v.isEmpty
                                  ? "Tanggal lahir wajib diisi"
                                  : null,
                    ),
                    const SizedBox(height: 16),
                    // Alamat
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Alamat"),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: _address,
                      decoration: _inputDecoration(),
                      validator:
                          (v) =>
                              v == null || v.isEmpty
                                  ? "Alamat wajib diisi"
                                  : null,
                    ),
                    const SizedBox(height: 16),
                    // Email
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Email"),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: _email,
                      decoration: _inputDecoration(hint: "contoh@email.com"),
                      validator:
                          (v) =>
                              v == null || v.isEmpty
                                  ? "Email wajib diisi"
                                  : null,
                    ),
                    const SizedBox(height: 16),
                    // No WhatsApp
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("No WhatsApp"),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: _whatsapp,
                      decoration: _inputDecoration(hint: "08xxxxxxxxxx"),
                      keyboardType: TextInputType.phone,
                      validator:
                          (v) =>
                              v == null || v.isEmpty
                                  ? "No WA wajib diisi"
                                  : null,
                    ),
                    const SizedBox(height: 16),
                    // Password
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Password"),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: _password,
                      obscureText: true,
                      decoration: _inputDecoration(),
                      validator:
                          (v) =>
                              v == null || v.length < 6
                                  ? "Password min 6 karakter"
                                  : null,
                    ),
                    const SizedBox(height: 16),
                    // Konfirmasi password
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Konfirmasi Password"),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: _confirmPassword,
                      obscureText: true,
                      decoration: _inputDecoration(),
                      validator:
                          (v) =>
                              v != _password.text
                                  ? "Password tidak sama"
                                  : null,
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: _onRegister,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF7FA893),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text("Register"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration({String? hint}) {
    return InputDecoration(
      hintText: hint ?? "",
      filled: true,
      fillColor: const Color(0xFFD9D9D9),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
    );
  }
}
