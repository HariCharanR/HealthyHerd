import 'package:flutter/material.dart';

class ResultSummary extends StatelessWidget {
  final String? resultText;
  final Widget? customContent;

  const ResultSummary({
    super.key,
    this.resultText,
    this.customContent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(51),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          const SizedBox(height: 16),
          _buildContent(),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.check_circle_outline,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(width: 16),
        const Text(
          'Analysis Results',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildContent() {
    if (customContent != null) {
      return customContent!;
    }

    return Text(
      resultText ?? 'Results will appear here',
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 16,
      ),
    );
  }
}
