import 'package:ai_connect/features/chatting/presentation/views/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class MobileHomeScreen extends StatefulWidget {
  const MobileHomeScreen({super.key});

  @override
  State<MobileHomeScreen> createState() => _MobileHomeScreenState();
}

class _MobileHomeScreenState extends State<MobileHomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true, appBar: CustomAppbar(index: 0), body: Card());
  }
}
