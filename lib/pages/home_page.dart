import 'package:blockchain_messages_app/services/feed_service.dart';
import 'package:blockchain_messages_app/widgets/add_message_sheet.dart';
import 'package:blockchain_messages_app/widgets/glass_tile.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var feedService = Provider.of<FeedService>(context, listen: false);
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xff22B76A), Color(0xff150FF0)],
              stops: [0.1, 0.9],
              begin: Alignment.center,
              end: Alignment.bottomCenter),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: feedService.isLoading
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    const SizedBox(height: 15),
                    Expanded(
                      child: ListView.builder(
                        itemCount: feedService.messages.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: GlassListTile(
                            title: Text(feedService.messages[index].message),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Theme.of(context).colorScheme.primary,
            onPressed: () => showAddMessageSheet(context),
            child: const Icon(Icons.add),
          ),
        ));
  }
}
