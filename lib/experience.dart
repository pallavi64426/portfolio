// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class Experience extends StatefulWidget {
  const Experience({super.key});

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  final List<Map<String, dynamic>> experiences = [
    {
      'title': 'Web Design Intern',
      'company': 'Tech Gyan, IIT Bombay',
      'desc': 'Focusing on creating responsive websites and innovative web solutions.',
      'tools': ['HTML', 'CSS'],
    },
    {
      'title': 'AI/ML Intern',
      'company': 'CodSoft',
      'desc': 'Gained AI/ML experience through hands-on project work.',
      'tools': ['Python', 'TensorFlow'],
    },
  ];

  List<bool> _showTooltip = [];

  @override
  void initState() {
    super.initState();
    _showTooltip = List.generate(experiences.length, (_) => false);
  }

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
                Icons.business_center,
                size: 48,
                color: Color(0xFF6366F1),
              ),
              const SizedBox(height: 16),
              Text(
                'Experience',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              ...List.generate(experiences.length, (index) {
                final exp = experiences[index];
                return TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: 1),
                  duration: const Duration(seconds: 2),
                  builder: (context, double animValue, child) {
                    double delay = index * 0.5;
                    double adjustedAnim = (animValue - delay) / (1 - delay);
                    adjustedAnim = adjustedAnim.clamp(0.0, 1.0);
                    return Opacity(
                      opacity: adjustedAnim,
                      child: Transform.translate(
                        offset: Offset(0, 50 * (1 - adjustedAnim)),
                        child: child,
                      ),
                    );
                  },
                  child: SizedBox(
                    height: 180,
                    child: Stack(
                      children: [
                      Positioned(
                        left: 20,
                        top: 25,
                        child: Container(
                          width: 2,
                          height: 100,
                          color: Colors.grey.shade400,
                        ),
                      ),
                      Positioned(
                        left: 15,
                        top: 20,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                            color: Color(0xFF6366F1),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 50,
                        top: 0,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6 > 600
                              ? 600
                              : MediaQuery.of(context).size.width * 0.6,
                          child: MouseRegion(
                            onEnter: (_) => setState(() => _showTooltip[index] = true),
                            onExit: (_) => setState(() => _showTooltip[index] = false),
                            child: Card(
                              elevation: 8,
                              shadowColor: Colors.blue.withOpacity(0.4),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(24),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      exp['title'],
                                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    Text(
                                      exp['company'],
                                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                            color: const Color(0xFF6366F1),
                                          ),
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      exp['desc'],
                                      style: Theme.of(context).textTheme.bodyLarge,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      ...(_showTooltip[index] ? [
                        Positioned(
                          left: 50,
                          top: -40,
                          child: Container(
                            width: 200,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Text(
                              'Tools: ${exp['tools'].join(', ')}',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ),
                      ] : []),
                    ],
                  ),
                  ));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
