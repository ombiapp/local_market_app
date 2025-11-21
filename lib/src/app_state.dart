import 'package:flutter/material.dart';
import 'models/listing.dart';
import 'models/message.dart';
import 'package:uuid/uuid.dart';

class AppState extends ChangeNotifier {
  final List<Listing> listings = [];
  final Map<String, List<Message>> messages = {};
  final _uuid = const Uuid();

  AppState() {
    // Sample starting data
    addListing('Home-made Pickles', 'Tasty mango pickles - 250g', 120);
    addListing('Handmade Soaps', 'Natural ingredients, 3 pcs', 200);
  }

  void addListing(String title, String desc, double price) {
    final id = _uuid.v4();
    final l = Listing(id: id, title: title, description: desc, price: price);
    listings.insert(0, l);
    messages[id] = [];
    notifyListeners();
  }

  void sendMessage(String listingId, String sender, String text) {
    final m = Message(
      id: _uuid.v4(),
      sender: sender,
      text: text,
      createdAt: DateTime.now(),
    );
    messages[listingId] ??= [];
    messages[listingId]!.add(m);
    notifyListeners();
  }
}
