// ignore_for_file: deprecated_member_use, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
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
                Icons.work_outline,
                size: 48,
                color: Color(0xFF6366F1),
              ),
              const SizedBox(height: 16),
              Text(
                'Projects',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Here are some of the projects I\'ve worked on, showcasing my skills in software development, AI/ML, and web technologies.',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 40),
              isMobile
                  ? Column(
                      children: _buildProjectCards(context),
                    )
                  : GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: _buildProjectCards(context),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildProjectCards(BuildContext context) {
    final projects = [
      {
        'title': 'Student.Hire App',
        'description': 'Flutter + Firebase job hiring app with location-based gigs, chat, and AI job matching.',
        'tech': ['Flutter', 'Firebase']
      },
      {
        'title': 'AI Resume Generator',
        'description': 'Desktop tool using OpenAI to generate ATS-friendly resumes and export PDF.',
        'tech': ['Python', 'OpenAI']
      },
      {
        'title': 'Text Summarization Tool',
        'description': 'Python NLP project to auto-summarize long documents.',
        'tech': ['Python', 'NLP']
      },
      {
        'title': 'MP3 Player Clone',
        'description': 'Web app replicating Spotify features (HTML, CSS, JS).',
        'tech': ['HTML', 'CSS', 'JavaScript']
      },
    ];

    return projects.map((project) {
      return HoverProjectCard(
        title: project['title']! as String,
        description: project['description']! as String,
        tech: project['tech'] as List<String>,
      );
    }).toList();
  }
}

class HoverProjectCard extends StatefulWidget {
  const HoverProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.tech,
  });

  final String title;
  final String description;
  final List<String> tech;

  @override
  State<HoverProjectCard> createState() => _HoverProjectCardState();
}

class _HoverProjectCardState extends State<HoverProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: Card(
          elevation: _isHovered ? 20 : 12,
          shadowColor: Colors.blue.withOpacity(_isHovered ? 0.6 : 0.4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.folder_open,
                      size: 24,
                      color: _isHovered ? Colors.blue : const Color(0xFF6366F1),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        widget.title,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  widget.description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: _isHovered ? Colors.blueGrey : null,
                      ),
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: widget.tech.map((tech) {
                    return Chip(
                      label: Text(
                        tech,
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black87,
                        ),
                      ),
                      backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(_isHovered ? 0.2 : 0.1),
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.primary.withOpacity(_isHovered ? 0.5 : 0.3),
                        width: 1,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
