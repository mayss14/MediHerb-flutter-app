import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/page-1/profile.dart';

class MultiSelect extends StatefulWidget {
  final List<String> items;
  const MultiSelect({Key? key, required this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference collectionRef =
      FirebaseFirestore.instance.collection("users");

  // this variable holds the selected items
  List<String> _selectedItems = [];

// This function is triggered when a checkbox is checked or unchecked
  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
  }

  void _cancel() {
    Navigator.pop(context);
  }

// this function is called when the Submit button is tapped
  void _submit() {
    collectionRef
        .doc(auth.currentUser!.uid)
        .collection("health-needs")
        .doc("dv5jbVUnoLnCQ1cJrXzP")
        .set({
      "besoins_sante": _selectedItems,
    });
    //Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UserProfile()),
    );
    //display the recipe card
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: const Text('Besoins de Santé'),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items
              .map((item) => CheckboxListTile(
                    checkColor: Color.fromARGB(255, 245, 248, 246),
                    activeColor: Color.fromARGB(255, 60, 101, 61),
                    value: _selectedItems.contains(item),
                    title: Text(item),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (isChecked) => _itemChange(item, isChecked!),
                  ))
              .toList(),
        ),
      ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            primary: Color.fromARGB(255, 60, 101, 61),
          ),
          onPressed: _cancel,
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          style: TextButton.styleFrom(
            primary: Color.fromARGB(255, 60, 101, 61),
          ),
          onPressed: _submit,
          child: const Text('Add '),
        ),
      ],
    );
  }
}
