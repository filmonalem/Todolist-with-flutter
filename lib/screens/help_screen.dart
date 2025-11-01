import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.grey.shade800;
    final cardColor = isDark ? const Color(0xFF1E293B) : Colors.white;
    final iconColor = isDark ? const Color(0xFF818CF8) : const Color(0xFF6366F1);

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF0F172A) : Colors.grey.shade50,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Center(
              child: Column(
                children: [
                  Icon(
                    Icons.help_center_rounded,
                    size: 64,
                    color: iconColor,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Help Guide",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Learn how to make the most of Loop TodoList",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 32),

            // Getting Started Section
            _buildSection(
              title: "🚀 Getting Started",
              children: [
                _buildStepCard(
                  step: "1",
                  title: "Add New Tasks",
                  description: "Type your task in the input field at the bottom and tap the '+' button to add it to your list.",
                  icon: Icons.add_task_rounded,
                  color: iconColor,
                  cardColor: cardColor,
                  textColor: textColor,
                ),
                _buildStepCard(
                  step: "2",
                  title: "Mark as Complete",
                  description: "Tap the checkbox next to any task to mark it as completed. Completed tasks will be moved to the bottom.",
                  icon: Icons.check_circle_rounded,
                  color: const Color(0xFF10B981),
                  cardColor: cardColor,
                  textColor: textColor,
                ),
                _buildStepCard(
                  step: "3",
                  title: "Delete Tasks",
                  description: "Swipe left on any task or tap the delete icon (🗑️) to remove it from your list permanently.",
                  icon: Icons.delete_rounded,
                  color: const Color(0xFFEF4444),
                  cardColor: cardColor,
                  textColor: textColor,
                ),
              ],
              textColor: textColor,
            ),

            const SizedBox(height: 24),

            // Features Section
            _buildSection(
              title: "✨ Features",
              children: [
                _buildFeatureCard(
                  icon: Icons.dark_mode_rounded,
                  title: "Dark & Light Mode",
                  description: "Toggle between themes using the sun/moon icon in the top right corner.",
                  color: iconColor,
                  cardColor: cardColor,
                  textColor: textColor,
                ),
                _buildFeatureCard(
                  icon: Icons.storage_rounded,
                  title: "Local Storage",
                  description: "Your tasks are automatically saved locally on your device.",
                  color: const Color(0xFF10B981),
                  cardColor: cardColor,
                  textColor: textColor,
                ),
                _buildFeatureCard(
                  icon: Icons.category_rounded,
                  title: "Organized Navigation",
                  description: "Use the drawer menu to access different sections of the app.",
                  color: const Color(0xFFF59E0B),
                  cardColor: cardColor,
                  textColor: textColor,
                ),
              ],
              textColor: textColor,
            ),

            const SizedBox(height: 24),

            // Tips Section
            _buildSection(
              title: "💡 Tips & Tricks",
              children: [
                _buildTipCard(
                  tip: "Be specific with your task descriptions for better clarity.",
                  cardColor: cardColor,
                  textColor: textColor,
                ),
                _buildTipCard(
                  tip: "Regularly review and clean up completed tasks.",
                  cardColor: cardColor,
                  textColor: textColor,
                ),
                _buildTipCard(
                  tip: "Use the app consistently to build a productive habit.",
                  cardColor: cardColor,
                  textColor: textColor,
                ),
              ],
              textColor: textColor,
            ),

            const SizedBox(height: 32),

            // Support Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.indigo.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.support_agent_rounded,
                    size: 40,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Need More Help?",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Visit the Contact section to get in touch with our support team.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.9),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required List<Widget> children,
    required Color textColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: textColor,
          ),
        ),
        const SizedBox(height: 16),
        ...children,
      ],
    );
  }

  Widget _buildStepCard({
    required String step,
    required String title,
    required String description,
    required IconData icon,
    required Color color,
    required Color cardColor,
    required Color textColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                step,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      icon,
                      color: color,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
    required Color cardColor,
    required Color textColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: color,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTipCard({
    required String tip,
    required Color cardColor,
    required Color textColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.lightbulb_rounded,
            color: const Color(0xFFF59E0B),
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              tip,
              style: TextStyle(
                fontSize: 14,
                color: textColor,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}