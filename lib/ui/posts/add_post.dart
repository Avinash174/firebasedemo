import 'package:firebase_database/firebase_database.dart';
import 'package:firebasedemo/utils/utils.dart';
import 'package:firebasedemo/widgets/round_button.dart';
import 'package:flutter/material.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  bool loading = false;
  final databaseRef = FirebaseDatabase.instance.ref('Post');
  final postController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            TextFormField(
              maxLines: 5,
              controller: postController,
              decoration: InputDecoration(
                hintText: 'Enter is in your mind?',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            RoundButton(
                title: 'Add Post',
                loading: loading,
                onTap: () {
                  setState(() {
                    loading=true;
                  });
                  databaseRef.child(DateTime.now().millisecondsSinceEpoch.toString()).set({
                    'title':postController.text.toString(),
                    'id':DateTime.now().millisecondsSinceEpoch.toString()
                  }).then((value) {
                    Utils().toastMsg('Post Added');
                  }).onError((error, stackTrace) {
                    Utils().toastMsg(error.toString());
                    setState(() {
                      loading=false;
                    });
                  });
                }),
          ],
        ),
      ),
    );
  }
}
