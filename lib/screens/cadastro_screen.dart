import 'package:flutter/material.dart';

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final _nomeController = TextEditingController();
  final _enderecoController = TextEditingController();
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _mostrarDados(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Dados Salvos com Sucesso!"),
          content: Text(
            "Nome: ${_nomeController.text}\n"
                "Endereço: ${_enderecoController.text}\n"
                "E-mail: ${_emailController.text}",
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Fechar"),
            ),
          ],
        ),
      );
    }
  }

  void _limparCampos() {
    _nomeController.clear();
    _enderecoController.clear();
    _emailController.clear();
    _formKey.currentState?.reset();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Operação cancelada.")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exercício Montagem GUI"),
        backgroundColor: Colors.green[800],
        foregroundColor: Colors.white,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "TELA DE CADASTRO",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),

                _buildField("NOME:", "Digite o nome", _nomeController, Icons.person),
                const SizedBox(height: 15),

                _buildField("ENDEREÇO:", "Digite o endereço", _enderecoController, Icons.home),
                const SizedBox(height: 15),

                _buildField("eMAIL:", "Digite o email", _emailController, Icons.email, isEmail: true),

                const SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton.icon(
                      onPressed: _limparCampos,
                      icon: const Icon(Icons.cancel),
                      label: const Text("CANCELAR"),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                    ),
                    const SizedBox(width: 15),
                    ElevatedButton.icon(
                      onPressed: () => _mostrarDados(context),
                      icon: const Icon(Icons.save),
                      label: const Text("SALVAR"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[800],
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildField(String label, String hint, TextEditingController controller, IconData icon, {bool isEmail = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 18, color: Colors.grey[700]),
            const SizedBox(width: 8),
            Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
        const SizedBox(height: 5),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            filled: true,
            fillColor: Colors.grey[50],

            errorStyle: const TextStyle(color: Colors.red),
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) return "Campo obrigatório";
            if (isEmail && !value.contains("@")) return "E-mail inválido";
            return null;
          },
        ),
      ],
    );
  }
}