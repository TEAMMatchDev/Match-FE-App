import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/event_controller.dart';

class EventScreen extends GetView<EventController> {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('event'),
    );
  }
}
