// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class Skills extends StatefulWidget {
  const Skills({super.key});

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  String? selectedCategory;

  final Map<String, List<String>> skillsData = {
    'Programming': ['Python', 'Java', 'C'],
    'Web': ['HTML', 'CSS', 'JavaScript', 'Flutter'],
    'Machine Learning': ['Supervised Learning', 'Unsupervised Learning', 'NLP', 'Computer Vision'],
    'Libraries': ['Pandas', 'NumPy', 'Matplotlib', 'Scikit-learn', 'PyTorch', 'TensorFlow'],
    'Databases': ['SQL', 'MySQL', 'MongoDB'],
    'Soft Skills': ['Problem Solving', 'Analytical Thinking', 'Team Collaboration', 'Communication'],
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.code,
                size: 48,
                color: Color(0xFF6366F1),
              ),
              const SizedBox(height: 16),
              Text(
                'Technical Skills',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: [
                  _buildFilterChip('All'),
                  ...skillsData.keys.map((category) => _buildFilterChip(category)),
                ],
              ),
              const SizedBox(height: 40),
              ..._buildCategories(context),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildCategories(BuildContext context) {
    if (selectedCategory == null || selectedCategory == 'All') {
      return skillsData.entries.map((entry) => _buildSkillCategory(context, entry.key, entry.value)).toList();
    } else {
      return [_buildSkillCategory(context, selectedCategory!, skillsData[selectedCategory!]!)];
    }
  }

  Widget _buildFilterChip(String category) {
    final isSelected = selectedCategory == category || (category == 'All' && selectedCategory == null);
    return FilterChip(
      label: Text(category),
      selected: isSelected,
      onSelected: (bool selected) {
        setState(() {
          if (selected) {
            selectedCategory = category == 'All' ? null : category;
          } else {
            selectedCategory = null;
          }
        });
      },
      backgroundColor: Colors.transparent,
      selectedColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
      checkmarkColor: Theme.of(context).colorScheme.primary,
    );
  }

  Widget _buildSkillCategory(BuildContext context, String category, List<String> skills) {
    return Card(
      elevation: 8,
      shadowColor: Colors.blue.withOpacity(0.4),
      margin: const EdgeInsets.only(bottom: 32),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: skills.map((skill) => _buildSkillChip(context, skill)).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillChip(BuildContext context, String skill) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        skill,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}
