// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key, this.onContactPressed});

  final VoidCallback? onContactPressed;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    return Container(
      height: isMobile ? 400 : 500,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF0B1940), // Navy blue gradient start
            Color(0xFF0F2440), // Navy blue gradient end
          ],
        ),
      ),
        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Pallavi Singh',
                  textStyle: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Colors.white,
                      ),
                  speed: const Duration(milliseconds: 150),
                ),
              ],
              totalRepeatCount: 1,
            ),
            const SizedBox(height: 20),
            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  'Software Engineer | AI/ML Enthusiast | Builder of Smart Solutions',
                  textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: const Color(0xFF00BCD4), // Cyan text
                      ),
                  speed: const Duration(milliseconds: 50),
                ),
              ],
              totalRepeatCount: 1,
            ),
            const SizedBox(height: 40),
            Wrap(
              spacing: 20,
              alignment: WrapAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    const url = 'https://www.linkedin.com/in/pallavi-singh012';
                    final uri = Uri.parse(url);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: const Color(0xFF0077B5), // LinkedIn blue
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.business),
                      SizedBox(width: 8),
                      Text('LinkedIn'),
                    ],
                  ),
                ),
                OutlinedButton(
                  onPressed: () async {
                    const url = 'https://github.com/pallavi64426';
                    final uri = Uri.parse(url);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    }
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Color(0xFF00BCD4), // Cyan outline
                      width: 2,
                    ),
                    foregroundColor: const Color(0xFF00BCD4),
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.code),
                      SizedBox(width: 8),
                      Text('GitHub'),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final emailUri = Uri(
                      scheme: 'mailto',
                      path: 'pallavisingh6442685@gmail.com',
                    );
                    if (await canLaunchUrl(emailUri)) {
                      await launchUrl(emailUri);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black87,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.email),
                      SizedBox(width: 8),
                      Text('Email'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () async {
                    const url = 'https://www.linkedin.com/in/pallavi-singh';
                    final uri = Uri.parse(url);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    }
                  },
                  icon: const Icon(Icons.business),
                  color: Colors.white,
                  tooltip: 'LinkedIn',
                ),
                IconButton(
                  onPressed: () async {
                    const url = 'https://github.com/pallavi-singh';
                    final uri = Uri.parse(url);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    }
                  },
                  icon: const Icon(Icons.code),
                  color: Colors.white,
                  tooltip: 'GitHub',
                ),
                IconButton(
                  onPressed: () async {
                    final emailUri = Uri(
                      scheme: 'mailto',
                      path: 'pallavi.singh@example.com',
                    );
                    if (await canLaunchUrl(emailUri)) {
                      await launchUrl(emailUri);
                    }
                  },
                  icon: const Icon(Icons.email),
                  color: Colors.white,
                  tooltip: 'Email',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
