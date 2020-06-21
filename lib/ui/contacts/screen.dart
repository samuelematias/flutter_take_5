import 'package:flutter/material.dart';

class ContactsScreen extends StatefulWidget {
  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  final _contacts = _dummyData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
        centerTitle: false,
      ),
      body: ListView.builder(
        itemCount: _contacts.length,
        itemBuilder: (context, index) {
          final _contact = _contacts[index];
          return ListTile(
            leading: Icon(Icons.person),
            title: Text(_contact.name),
            subtitle: Text(_contact.email),
            onTap: () {},
          );
        },
      ),
    );
  }
}

List<Contact> _dummyData() {
  return [
    Contact('John Doe', 'john@app.com'),
    Contact('Susan Smith', 'susan@gmail.com'),
    Contact('James Hatfield', 'james.hatfield@yahoo.com'),
    Contact('Steve Jobs', 'steve@apple.com'),
    Contact('Bill Gates', 'gates@microsoft.com'),
    Contact('Elon Musk', 'elon@tesla.com'),
    Contact('John Smith', 'smith77@me.com'),
  ];
}

class Contact {
  final String name;
  final String email;

  Contact(this.name, this.email);
}
