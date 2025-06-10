import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();



  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _sendResetLink() {
    if (_formKey.currentState?.validate() ?? false) {
      String email = _emailController.text;
      // ignore: avoid_print
      print('Sending password reset link to: $email');
      // Simular envio de link
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Link de redefinição enviado para $email (simulação)'),
        ),
      );
      // Poderia navegar de volta para Login ou mostrar uma mensagem de sucesso
      Navigator.pop(context); // Volta para a tela anterior (LoginScreen)
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    final textScaler = MediaQuery.textScaleFactorOf(context);
    
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAF9),
      body: Stack(
        children: [
          // Formas circulares de fundo
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueGrey.withAlpha(30),
              ),
            ),
          ),
          Positioned(
            bottom: -80,
            right: -80,
            child: Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.teal.withAlpha(30),
              ),
            ),
          ),
          Positioned(
            top: 150,
            right: -120,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.tealAccent.withAlpha(30),
              ),
            ),
          ),

          // Conteúdo principal
          SafeArea(
            child: Stack(
              children: [
                // Botão de voltar
                Positioned(
                  top: 20,
                  left: 20,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, size: 24),
                    color: Colors.black87,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Image.asset(
                            'assets/images/logo.png',
                            height: 180,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                height: 180,
                                color: Colors.grey[300],
                                child: Center(
                                  child: Text(
                                    'Erro ao carregar imagem: logo.png',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 40),
                          Text(
                            'Recuperar Senha',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: textScaler * 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          Text(
                            'Insira o email associado à sua conta e enviaremos um link para redefinir sua senha.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: textScaler * 16,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 32.0),
                          TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              hintText: 'seuemail@example.com',
                              prefixIcon: Icon(Icons.email_outlined),
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, insira seu email';
                              }
                              if (!value.contains('@') || !value.contains('.')) {
                                return 'Por favor, insira um email válido';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 32.0),
                          ElevatedButton(
                            onPressed: _sendResetLink,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF44C3E0),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'Enviar Link de Redefinição',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
