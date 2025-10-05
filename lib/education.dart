// ignore_for_file: avoid_unnecessary_containers, deprecated_member_use

import 'package:flutter/material.dart';

class Education extends StatefulWidget {
  const Education({super.key});

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.school,
                size: 48,
                color: Color(0xFF6366F1),
              ),
              const SizedBox(height: 16),
              Text(
                'Education',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              _buildEducationCard(
                context,
                'B.Tech (CSE - AI), CSJM University Kanpur — GPA: 8.00 (2021–2025)',
              ),
              const SizedBox(height: 20),
              _buildEducationCard(
                context,
                'Senior Secondary: St. Joseph\'s School, Gorakhpur — 83%',
              ),
              const SizedBox(height: 20),
              _buildEducationCard(
                context,
                'Secondary: St. Joseph\'s School, Gorakhpur — 92%',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEducationCard(BuildContext context, String education) {
    return Container(
      child: Card(
        elevation: 8,
        shadowColor: Colors.blue.withOpacity(0.4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            children: [
              Icon(
                Icons.school,
                size: 40,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  education,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
