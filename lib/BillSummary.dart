import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:splitty/Bill.dart';

class BillSummary extends StatelessWidget {

  final Bill bill;

  BillSummary({super.key, required this.bill});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bill Summary'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${bill.name}'),
            Text('Date: ${bill.date}'),
            Text('Total Amount: ${bill.total.toStringAsFixed(2)}'),
            Text('Attachment: ${bill.attachment}'),
            // Add more attributes as needed
          ],
        ),
      ),
    );
  }
  
}