
import 'package:demo_practice/core/hive/open_provider_hive.dart';
import 'package:demo_practice/features/presentation/tickets/list_builder.dart';
import 'package:demo_practice/features/presentation/tickets/tickets_open.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class TicketPage extends StatelessWidget {
  TicketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ticketProviderHiveOpen = Provider.of<OpenProviderHive>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tickets List",
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TicketCreateOpen(
                    itemKey: null,
                    eventProviderHive: ticketProviderHiveOpen,
                    ctx: context,
                  ),
                ),
              );
            },
            child: Text("Create a new ticket Opening"),
          ),
          const Text(
            "Opening Ceremony",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Consumer<OpenProviderHive>(
            builder: (context, data, child) {
              return Expanded(
                child: ListBuilder(data, ticketProviderHiveOpen, context,
                    aty: "open"),
              );
            },
          ),

        ],
      ),
    );
  }
}