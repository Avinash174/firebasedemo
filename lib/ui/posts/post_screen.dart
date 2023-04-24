import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebasedemo/ui/posts/add_post.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('Post');
  final searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Screen'),
      ),
      body: Column(
        children: [
          // Expanded(
          //     child: StreamBuilder(
          //   stream: ref.onValue,
          //   builder:
          //       (BuildContext context, AsyncSnapshot<DatabaseEvent> snapshot) {
          //
          //         if(!snapshot.hasData){
          //           return CircularProgressIndicator();
          //
          //         }else{
          //           Map<dynamic,dynamic> map=snapshot.data!.snapshot.value as dynamic;
          //           List <dynamic> list=[];
          //           list.clear();
          //           list=map.values.toList();
          //           return ListView.builder(
          //             itemCount: snapshot.data!.snapshot.children.length,
          //             itemBuilder: (BuildContext context, int index) {
          //               return ListTile(
          //                 title: Text(list[index]['title']),
          //                 subtitle: Text(list[index]['id']),
          //               );
          //
          //             },
          //           );
          //         }
          //   },
          // )),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search',
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (String value) {
                setState(() {});
              },
            ),
          ),

          Expanded(
            child: FirebaseAnimatedList(
                query: ref,
                defaultChild: Text('Loading'),
                itemBuilder: (context, snapshot, animation, index) {
                  final title = Text(snapshot.child('id').value.toString());
                  if (searchController.text.isEmpty) {
                    return ListTile(
                      title: Text(snapshot.child('id').value.toString(),),
                      subtitle: Text(snapshot.child('title').value.toString(),),
                      trailing: PopupMenuButton(
                        icon: Icon(Icons.more_vert),
                        itemBuilder: (BuildContext context) => [
                          PopupMenuItem(
                            onTap: (){
                              Navigator.pop(context);
                              showMyDilog();
                            },
                            value: 1,
                            child: ListTile(
                              leading: Icon(Icons.edit),
                              title: Text('Edit'),
                            ),
                          ),
                          PopupMenuItem(
                            value: 1,
                            child: ListTile(
                              leading: Icon(Icons.delete),
                              title: Text('Delete'),
                            ),
                          ),
                        ],
                      ),

                    );
                  } else if (title
                      .toString()
                      .toLowerCase()
                      .contains(searchController.toString().toLowerCase())) {
                    return ListTile(
                      title: Text(snapshot.child('id').value.toString()),
                      subtitle: Text(snapshot.child('title').value.toString()),
                    );
                  } else {
                    return Container();
                  }
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => AddPost()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
  Future<void>showMyDilog(){
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text('Update'),
        content: Container(
          child: TextField(

          ),
        ),
        actions: [],

      );

    });
  }
}
