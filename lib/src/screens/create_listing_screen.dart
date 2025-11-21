import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_state.dart';

class CreateListingScreen extends StatefulWidget {
  const CreateListingScreen({super.key});

  @override
  State<CreateListingScreen> createState() => _CreateListingScreenState();
}

class _CreateListingScreenState extends State<CreateListingScreen> {
  final _title = TextEditingController();
  final _desc = TextEditingController();
  final _price = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<AppState>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: const Text('New Listing')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(controller: _title, decoration: const InputDecoration(labelText: 'Title')),
            TextField(controller: _desc, decoration: const InputDecoration(labelText: 'Description')),
            TextField(controller: _price, decoration: const InputDecoration(labelText: 'Price'), keyboardType: TextInputType.number),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                final p = double.tryParse(_price.text) ?? 0;
                app.addListing(_title.text, _desc.text, p);
                Navigator.pop(context);
              },
              child: const Text('Create'),
            )
          ],
        ),
      ),
    );
  }
}
