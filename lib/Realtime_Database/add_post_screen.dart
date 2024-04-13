import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final postController =TextEditingController();
  bool loading = false;
  final databaseRef = FirebaseDatabase.instance.ref('Post');
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
              maxLines: 4,
              controller: postController,
              decoration: const InputDecoration(
                hintText: 'This is the Post',
                    border: OutlineInputBorder()
              ),

            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: (){
              databaseRef.child('1').set({
                'id' : 1
              });
              },
              child: const Text('Add'),
            ),

          ],
        ),
      ),
    );
  }
}
