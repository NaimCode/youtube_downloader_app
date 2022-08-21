import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_downloader/constants/theme.dart';
import 'package:youtube_downloader/constants/variables.dart';
import 'package:youtube_downloader/pages/Video/video_select_download.dart';

import '../../../bloc/video/video_bloc.dart';

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
                if (value!.isEmpty
                    // || !value.startsWith(YOUTUBE_STARTING_URL)
                    ) {
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
                hintText: '${YOUTUBE_STARTING_URL}ReKDJMI8dNQ',
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
                primary: PRIMARY,
              ),
              icon: const Icon(Icons.download_rounded),
              label: const Text('Télécharger'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  //navigate to new page
                  BlocProvider.of<VideoBloc>(context).add(
                    VideoEventLoadMetaData(
                      url: _urlController.text,
                    ),
                  );
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              VideoSelectDownload(url: _urlController.text)));
                }
              },
            ),
          ],
        ),
      )),
    );
  }
}
