import 'package:flutter/material.dart';
import 'package:healthyherd/widgets/Home/action_buttons.dart';
import 'package:healthyherd/widgets/Home/result_summary.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();


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
                    const SizedBox(height: 24),
                    _buildImageContainer(),
                    const SizedBox(height: 18),
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

  // Widget _buildTitle() {
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
            child: _selectedImage != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      _selectedImage!,
                      fit: BoxFit.contain,
                      width: double.infinity,
                      height: double.infinity,
                      errorBuilder: (context, error, stackTrace) {
                        return _buildPlaceholder();
                      },
                    ),
                  )
                : _buildPlaceholder(),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Center(
      child: Column(
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
            onPressed: () => _pickImage(ImageSource.gallery),
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: ActionButtons(
            buttonText: 'Take Image',
            icon: Icons.camera_alt,
            onPressed: () => _pickImage(ImageSource.camera),
          ),
        ),
      ],
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: source,
        maxWidth: 1200,
        maxHeight: 1200,
        imageQuality: 90,
      );
      if (image != null && mounted) {
        setState(() {
          _selectedImage = File(image.path);
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
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
