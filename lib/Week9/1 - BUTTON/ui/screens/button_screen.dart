import 'package:flutter/material.dart';

import '../../data/repository/button_repository.dart';
import '../../data/repository/repository_exception.dart';
import '../../model/button_status.dart';
import '../utils/async_data.dart';

class ButtonScreen extends StatefulWidget {
  const ButtonScreen({super.key});

  @override
  State<ButtonScreen> createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {
  AsyncData<ButtonStatus> data = AsyncData.notstarted();

  @override
  void initState() {
    super.initState();
    _fetchButtonData();
  }

  Future<void> _fetchButtonData() async {
    setState(() {
      data = AsyncData.loading();
    });

    try {
      ButtonStatus button = await ButtonRepository.instance.getButtonStatus();

      setState(() {
        data = AsyncData.success(button);
      });
    } on RepositoryException catch (e) {
      setState(() {
        data = AsyncData.error(e.message);
      });
    }
  }

  Future<void> _toggleButton() async {
    if (data.status != AsyncStatus.success) return;

    ButtonStatus button = data.value!;

    try {
      await ButtonRepository.instance.updateSelected(!button.selected);
      await _fetchButtonData();
    } on RepositoryException catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget body;

    switch (data.status) {
      case AsyncStatus.notstarted:
      case AsyncStatus.loading:
        body = const Center(child: CircularProgressIndicator());
        break;

      case AsyncStatus.error:
        body = Center(child: Text(data.error!));
        break;

      case AsyncStatus.success:
        ButtonStatus button = data.value!;

        body = Center(
          child: ElevatedButton(
            onPressed: _toggleButton,
            style: ElevatedButton.styleFrom(
              backgroundColor: button.selected ? Colors.blue : Colors.grey,
            ),
            child: Text(button.name),
          ),
        );
        break;
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Button Status")),
      body: body,
    );
  }
}
