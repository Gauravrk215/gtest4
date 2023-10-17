// ignore_for_file: use_build_context_synchronously
import 'dart:convert';import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:authsec_flutter/Entity/btrst1/Gtesr/Gtesr_api_service.dart';
import 'dart:math';
import 'package:authsec_flutter/providers/token_manager.dart';

import 'package:flutter/services.dart';
class UpdateEntityScreen extends StatefulWidget {
    final Map<String, dynamic> entity;


  UpdateEntityScreen({required this.entity});

  @override
  _UpdateEntityScreenState createState() => _UpdateEntityScreenState();
}

class _UpdateEntityScreenState extends State<UpdateEntityScreen> {
  final ApiService apiService = ApiService();
  final _formKey = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Update Gtesr')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
          children: [
 
 TextFormField(
   initialValue: widget.entity['collge'],
                  decoration: const InputDecoration(labelText: 'collge'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a collge';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    widget.entity['collge'] = value;
                  },
                ),
                const SizedBox(height: 16),

 TextFormField(
   initialValue: widget.entity['name'],
                  decoration: const InputDecoration(labelText: 'name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    widget.entity['name'] = value;
                  },
                ),
                const SizedBox(height: 16),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5), // Add margin
              child: ElevatedButton(
                onPressed: () async {
if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
       
                        final token = await TokenManager.getToken();
                        try {
                          await apiService.updateEntity(
                              token!,
                              widget.entity[
                                  'id'], // Assuming 'id' is the key in your entity map
                              widget.entity);   
                    Navigator.pop(context);
                  } catch (e) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Error'),
                          content: Text('Failed to update entity: $e'),
                          actions: [
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
  }                }
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  child: const Center(
                    child: Text(
                      'UPDATE',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
 ),), 
   );
  }
}