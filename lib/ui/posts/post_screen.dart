import 'package:firebasedemo/ui/posts/add_post.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Screen'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        
        Navigator.push(context, MaterialPageRoute(builder: (_)=>AddPost()));
        
      },
        child: Icon(Icons.add),

      ),
    );
  }
}
