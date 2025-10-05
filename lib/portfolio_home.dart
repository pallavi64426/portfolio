// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'themes.dart';
import 'hero_section.dart';
import 'about_me.dart';
import 'skills.dart';
import 'projects.dart';
import 'experience.dart';
import 'research.dart';
import 'education.dart';
import 'contact.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _researchKey = GlobalKey();
  final GlobalKey _educationKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  bool _showBackToTop = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >= 200 && !_showBackToTop) {
      setState(() => _showBackToTop = true);
    } else if (_scrollController.offset < 200 && _showBackToTop) {
      setState(() => _showBackToTop = false);
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _scrollToContact() {
    if (_contactKey.currentContext == null) return;
    Scrollable.ensureVisible(
      _contactKey.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _scrollToSection(GlobalKey key) {
    if (key.currentContext == null) return;
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    return Scaffold(
      body: AnimatedBackground(
        child: Container(
          decoration: const BoxDecoration(
            gradient: AppThemes.darkGradient,
          ),
        child: Stack(
        children: [
          ListView(
            controller: _scrollController,
            children: [
              HeroSection(onContactPressed: _scrollToContact),
              Container(
                key: _aboutKey,
                child: const AboutMe(),
              ),
              Container(
                key: _skillsKey,
                child: const Skills(),
              ),
              Container(
                key: _projectsKey,
                child: const Projects(),
              ),
              Container(
                key: _experienceKey,
                child: const Experience(),
              ),
              Container(
                key: _researchKey,
                child: const Research(),
              ),
              Container(
                key: _educationKey,
                child: const Education(),
              ),
              Container(
                key: _contactKey,
                child: const Contact(),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 40),
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.white10,
                      width: 1,
                    ),
                  ),
                ),
                child: Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () async {
                              const url = 'https://www.linkedin.com/in/pallavi-singh012';
                              final uri = Uri.parse(url);
                              if (await canLaunchUrl(uri)) {
                                await launchUrl(uri);
                              }
                            },
                            icon: const Icon(Icons.business),
                            color: Colors.white70,
                            tooltip: 'LinkedIn',
                            hoverColor: const Color(0xFF00BCD4).withOpacity(0.3),
                          ),
                          IconButton(
                            onPressed: () async {
                              const url = 'https://github.com/pallavi64426';
                              final uri = Uri.parse(url);
                              if (await canLaunchUrl(uri)) {
                                await launchUrl(uri);
                              }
                            },
                            icon: const Icon(Icons.code),
                            color: Colors.white70,
                            tooltip: 'GitHub',
                            hoverColor: const Color(0xFF00BCD4).withOpacity(0.3),
                          ),
                          IconButton(
                            onPressed: () async {
                              final emailUri = Uri(
                                scheme: 'mailto',
                                path: 'pallavisingh6442685@gmail.com',
                              );
                              if (await canLaunchUrl(emailUri)) {
                                await launchUrl(emailUri);
                              }
                            },
                            icon: const Icon(Icons.email),
                            color: Colors.white70,
                            tooltip: 'Email',
                            hoverColor: const Color(0xFF00BCD4).withOpacity(0.3),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '© 2025 Pallavi Singh | Built with Flutter',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (!isMobile)
            Positioned(
              top: 20,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () => _scrollToSection(_aboutKey),
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white70,
                              textStyle: const TextStyle(fontSize: 16),
                            ),
                            child: const Text('About'),
                          ),
                          const SizedBox(width: 16),
                          TextButton(
                            onPressed: () => _scrollToSection(_skillsKey),
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white70,
                              textStyle: const TextStyle(fontSize: 16),
                            ),
                            child: const Text('Skills'),
                          ),
                          const SizedBox(width: 16),
                          TextButton(
                            onPressed: () => _scrollToSection(_projectsKey),
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white70,
                              textStyle: const TextStyle(fontSize: 16),
                            ),
                            child: const Text('Projects'),
                          ),
                          const SizedBox(width: 16),
                          TextButton(
                            onPressed: () => _scrollToSection(_experienceKey),
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white70,
                              textStyle: const TextStyle(fontSize: 16),
                            ),
                            child: const Text('Experience'),
                          ),
                          const SizedBox(width: 16),
                          TextButton(
                            onPressed: () => _scrollToSection(_researchKey),
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white70,
                              textStyle: const TextStyle(fontSize: 16),
                            ),
                            child: const Text('Research'),
                          ),
                          const SizedBox(width: 16),
                          TextButton(
                            onPressed: () => _scrollToSection(_educationKey),
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white70,
                              textStyle: const TextStyle(fontSize: 16),
                            ),
                            child: const Text('Education'),
                          ),
                          const SizedBox(width: 16),
                          TextButton(
                            onPressed: _scrollToContact,
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white70,
                              textStyle: const TextStyle(fontSize: 16),
                            ),
                            child: const Text('Contact'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if (_showBackToTop)
            Positioned(
              bottom: 20,
              right: 20,
              child: FloatingActionButton(
                onPressed: _scrollToTop,
                backgroundColor: Theme.of(context).colorScheme.primary,
                tooltip: 'Back to Top',
                child: const Icon(Icons.arrow_upward),
              ),
            ),
        ],
        ),
        ),
      ),
    );
  }
}

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({super.key, required this.child});

  final Widget child;

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 2 * 3.14159).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Stack(
              children: List.generate(20, (index) {
                final x = (index * 100 + _animation.value * 50 + MediaQuery.of(context).size.width).floor() % MediaQuery.of(context).size.width.toInt();
                final y = (index * 80 + _animation.value * 30 + MediaQuery.of(context).size.height).floor() % MediaQuery.of(context).size.height.toInt();
                return Positioned(
                  left: x.toDouble(),
                  top: y.toDouble(),
                  child: Container(
                    width: 4 + index % 3 * 2,
                    height: 4 + index % 3 * 2,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                  ),
                );
              }),
            );
          },
        ),
        widget.child,
      ],
    );
  }
}
