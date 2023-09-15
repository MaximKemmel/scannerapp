import 'package:flutter/material.dart';
import 'package:scanner_app/ui/screens/home/pages/premium.dart';

class PremiumScreen extends StatefulWidget {
  const PremiumScreen({super.key});

  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PremiumPage(),
    );
  }
}
