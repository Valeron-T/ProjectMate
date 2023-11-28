import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.blue[50],
          foregroundColor: Colors.grey[700],
          centerTitle: true,
          title: const Text("Account"),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {}, child: const Text("Sign In with Google"))
            ],
          ),
        ),
      ),
    );
  }
}
