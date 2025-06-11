import 'package:flutter/material.dart';
import 'package:file_selector/file_selector.dart';
import 'package:open_file/open_file.dart';

class ReaderScreen extends StatefulWidget {
  const ReaderScreen({super.key});

  @override
  State<ReaderScreen> createState() => _ReaderScreenState();
}

class _ReaderScreenState extends State<ReaderScreen> {
  final List<String> _supportedFormats = [
    'epub',
    'doc',
    'docx',
    'rtf',
    'txt',
    'pdf',
  ];
  String? _selectedFilePath;
  String? _fileName;

  Future<void> _pickFile() async {
    try {
      final typeGroup = XTypeGroup(
        label: 'Arquivos de texto',
        extensions: _supportedFormats,
      );

      final XFile? file = await openFile(acceptedTypeGroups: [typeGroup]);

      if (!mounted) return;

      if (file != null) {
        setState(() {
          _selectedFilePath = file.path;
          _fileName = file.name;
        });
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Erro ao selecionar arquivo: $e')));
    }
  }

  Future<void> _openFile() async {
    if (_selectedFilePath != null) {
      await OpenFile.open(_selectedFilePath);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAF9),
      appBar: AppBar(
        title: const Text('Leitor de Textos'),
        backgroundColor: Colors.blueGrey,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withAlpha(
                        51,
                      ), // substituído withOpacity(0.2)
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      'Selecione um arquivo para ler',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: _pickFile,
                      icon: const Icon(Icons.upload_file),
                      label: const Text('Selecionar Arquivo'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                    if (_fileName != null)
                      Column(
                        children: [
                          const SizedBox(height: 24),
                          Text(
                            'Arquivo selecionado: $_fileName',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.blueGrey,
                            ),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton.icon(
                            onPressed: _openFile,
                            icon: const Icon(Icons.open_in_new),
                            label: const Text('Abrir Arquivo'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Formatos suportados:\nEPUB, DOC, DOCX, RTF, TXT, PDF',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
