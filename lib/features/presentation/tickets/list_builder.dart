import 'package:flutter/material.dart';


Widget ListBuilder(data, ticketProviderHive, context, {required String aty}) {
  return ListView.builder(
    itemCount: data.items.length,
    itemBuilder: (_, index) {
      final currentItem = data.items[index];
      return Card(
        color: Colors.orange.shade100,
        margin: const EdgeInsets.all(10),
        elevation: 3,
        child: ListTile(
          title: Text(
            currentItem["name"],
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            currentItem["place"],
            style: TextStyle(color: Colors.black),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                 
                },
                icon: Icon(Icons.edit),
              ),
              IconButton(
                onPressed: () {
                  ticketProviderHive.deleteItem(currentItem["key"]);
                },
                icon: Icon(Icons.delete),
              ),
            ],
          ),
        ),
      );
    },
  );
}