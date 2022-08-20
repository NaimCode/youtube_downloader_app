import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _urlController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _urlController.dispose();
    _formKey.currentState?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                      color: Colors.amber[800],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(13))),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.link),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: TextFormField(
                          validator: (url) {
                            if (url!.isEmpty ||
                                !url.startsWith(
                                    "https://www.youtube.com/watch?v=")) {
                              return 'Entrer un url valide';
                            }
                            return null;
                          },
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText:
                                  'https://www.youtube.com/watch?v=5wAna-QQLAc',
                              hintStyle: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50.0),
                ElevatedButton.icon(
                    onPressed: () {
                      //
                      if (_formKey.currentState!.validate()) {
                        //call event bloc

                      }
                    },
                    icon: const Icon(Icons.download),
                    label: const Text('Download'))
              ],
            ),
          ),
        ));
  }
}
