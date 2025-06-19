import 'package:flutter/material.dart';

class AddReviewScreen extends StatefulWidget {
  const AddReviewScreen({super.key});
  static final String name = '/add-review';
  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _reviewTEController = TextEditingController();
  final GlobalKey _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Review')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _firstNameTEController,
                decoration: InputDecoration(hintText: 'First Name'),
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _lastNameTEController,
                decoration: InputDecoration(hintText: 'Last Name'),
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _reviewTEController,
                decoration: InputDecoration(hintText: 'Write Review'),
                maxLines: 8,
              ),
              SizedBox(height: 16),
              ElevatedButton(onPressed: () {}, child: Text('Submit')),
            ],
          ),
        ),
      ),
    );
  }
}
