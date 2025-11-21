import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_state.dart';
import '../models/listing.dart';
import 'create_listing_screen.dart';
import 'listing_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Local Market')),
      body: ListView.builder(
        itemCount: app.listings.length,
        itemBuilder: (context, index) {
          final Listing l = app.listings[index];
          return ListTile(
            title: Text(l.title),
            subtitle: Text(l.description),
            trailing: Text('₹${l.price.toStringAsFixed(0)}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ListingDetailScreen(listing: l),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const CreateListingScreen()),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
