import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  const Input({Key? key}) : super(key: key);

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _urlController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _urlController.dispose();
    _formKey.currentState?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextFormField(
              controller: _urlController,
              validator: (value) {
                if (value!.isEmpty ||
                    !value.startsWith('https://www.youtube.com/watch?v')) {
                  return 'Entrer un lien youtube valide';
                }
                return null;
              },
              style: const TextStyle(fontSize: 14),
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines: 3,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                filled: true,
                border: InputBorder.none,
                hintText: 'https://www.youtube.com/watch?v=ReKDJMI8dNQ',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
            const SizedBox(
              height: 20,
              child: Center(
                child: Divider(),
              ),
            ),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                primary: const Color(0xffe7b291),
              ),
              icon: const Icon(Icons.download_rounded),
              label: const Text('Télécharger'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {}
              },
            ),
          ],
        ),
      )),
    );
  }
}
