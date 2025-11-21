import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/listing.dart';
import '../app_state.dart';

class ListingDetailScreen extends StatefulWidget {
  final Listing listing;
  const ListingDetailScreen({required this.listing, super.key});

  @override
  State<ListingDetailScreen> createState() => _ListingDetailScreenState();
}

class _ListingDetailScreenState extends State<ListingDetailScreen> {
  final _msg = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<AppState>(context);
    final messages = app.messages[widget.listing.id] ?? [];
    return Scaffold(
      appBar: AppBar(title: Text(widget.listing.title)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(widget.listing.description),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, idx) {
                final m = messages[idx];
                return ListTile(
                  title: Text(m.sender),
                  subtitle: Text(m.text),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
            child: Row(
              children: [
                Expanded(child: TextField(controller: _msg, decoration: const InputDecoration(hintText: 'Message'))),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    if (_msg.text.trim().isEmpty) return;
                    app.sendMessage(widget.listing.id, 'You', _msg.text.trim());
                    _msg.clear();
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
