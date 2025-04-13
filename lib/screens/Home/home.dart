import 'package:flutter/material.dart';
import 'package:healthyherd/widgets/Home/action_buttons.dart';
import 'package:healthyherd/widgets/Home/result_summary.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HealthyHerd',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 16),
                    _buildTitle(),
                    const SizedBox(height: 24),
                    _buildImageContainer(),
                    _buildActionButtons(),
                    _buildAnalyzeButton(),
                    const ResultSummary(),
                    const SizedBox(height: kBottomNavigationBarHeight),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTitle() {
    return const Center(
      child: Text(
        'AI-Powered Disease Detector',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _buildImageContainer() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(51),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Image.asset(
                'assets/placeholder_image.png',
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.image_not_supported,
                        size: 48,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'No Image Uploaded',
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: ActionButtons(
            buttonText: 'Load Image',
            icon: Icons.photo_library,
            onPressed: () {
              // This will be connected to backend logic later
            },
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ActionButtons(
            buttonText: 'Take Image',
            icon: Icons.camera_alt,
            onPressed: () {
              // This will be connected to backend logic later
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAnalyzeButton() {
    return ActionButtons(
      buttonText: 'Analyze Image',
      icon: Icons.analytics,
      onPressed: () {
        // This will be connected to backend logic later
      },
    );
  }
}
