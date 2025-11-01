import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  Future<void> _launchEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'looptechplc@gmail.com',
      query: encodeQueryParameters(<String, String>{
        'subject': 'Loop TodoList Support',
        'body': 'Hello Loop Team,\n\nI would like to...',
      }),
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    }
  }

  Future<void> _launchPhone() async {
    final Uri phoneLaunchUri = Uri(
      scheme: 'tel',
      path: '+251925439814',
    );

    if (await canLaunchUrl(phoneLaunchUri)) {
      await launchUrl(phoneLaunchUri);
    }
  }

  Future<void> _launchMaps() async {
    final Uri mapsLaunchUri = Uri(
      scheme: 'https',
      host: 'maps.google.com',
      queryParameters: {
        'q': 'Mekele, Tigray, Ethiopia',
      },
    );

    if (await canLaunchUrl(mapsLaunchUri)) {
      await launchUrl(mapsLaunchUri);
    }
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.grey.shade800;
    final cardColor = isDark ? const Color(0xFF1E293B) : Colors.white;
    final primaryColor = isDark ? const Color(0xFF818CF8) : const Color(0xFF6366F1);

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF0F172A) : Colors.grey.shade50,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Header Section
            Container(
              padding: const EdgeInsets.all(24),
              margin: const EdgeInsets.only(bottom: 24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF6366F1), Color(0xFF10B981)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.indigo.withOpacity(0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.contact_support_rounded,
                    size: 64,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Get In Touch",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "We're here to help you with any questions or feedback about Loop TodoList",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.9),
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            // Contact Methods Section
            _buildSectionTitle("📞 Contact Methods", textColor),
            const SizedBox(height: 16),

            // Email Card
            _buildContactCard(
              icon: Icons.email_rounded,
              title: "Email Support",
              subtitle: "Get detailed assistance via email",
              contact: "looptechplc@gmail.com",
              color: const Color(0xFFEA4335),
              cardColor: cardColor,
              textColor: textColor,
              onTap: _launchEmail,
            ),

            const SizedBox(height: 12),

            // Phone Card
            _buildContactCard(
              icon: Icons.phone_rounded,
              title: "Phone Support",
              subtitle: "Call us for immediate help",
              contact: "+251 925 439 814",
              color: const Color(0xFF34A853),
              cardColor: cardColor,
              textColor: textColor,
              onTap: _launchPhone,
            ),

            const SizedBox(height: 12),

            // Address Card
            _buildContactCard(
              icon: Icons.location_on_rounded,
              title: "Our Location",
              subtitle: "Visit us or get directions",
              contact: "Mekele, Tigray, Ethiopia",
              color: const Color(0xFF4285F4),
              cardColor: cardColor,
              textColor: textColor,
              onTap: _launchMaps,
            ),

            const SizedBox(height: 32),

            // Support Hours Section
            _buildSectionTitle("🕒 Support Hours", textColor),
            const SizedBox(height: 16),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.access_time_rounded,
                        color: primaryColor,
                        size: 24,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        "Availability",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: textColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildScheduleItem("Monday - Friday", "9:00 AM - 6:00 PM", textColor),
                  _buildScheduleItem("Saturday", "10:00 AM - 4:00 PM", textColor),
                  _buildScheduleItem("Sunday", "Closed", textColor),
                  const SizedBox(height: 8),
                  Divider(color: Colors.grey.shade400),
                  const SizedBox(height: 8),
                  Text(
                    "Response Time: We typically respond within 2-4 hours during business days.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Feedback Section
            _buildSectionTitle("💬 Send Feedback", textColor),
            const SizedBox(height: 16),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.feedback_rounded,
                    size: 48,
                    color: primaryColor,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "We Value Your Opinion",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Your feedback helps us improve Loop TodoList. Let us know what you think!",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: _launchEmail,
                    icon: const Icon(Icons.email_rounded),
                    label: const Text("Send Feedback"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Company Info Section
            _buildSectionTitle("🏢 About LoopTech", textColor),
            const SizedBox(height: 16),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.business_center_rounded,
                    size: 48,
                    color: primaryColor,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "LoopTech PLC",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Based in Mekele, Tigray, Ethiopia\nCreating innovative solutions for better productivity",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Social Links
            _buildSectionTitle("🌐 Follow Us", textColor),
            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialButton(
                  icon: Icons.facebook_rounded,
                  color: const Color(0xFF1877F2),
                  onTap: () {},
                ),
                const SizedBox(width: 16),
                _buildSocialButton(
                  icon: Icons.chat_rounded,
                  color: const Color(0xFF25D366),
                  onTap: () {},
                ),
                const SizedBox(width: 16),
                _buildSocialButton(
                  icon: Icons.camera_alt_rounded,
                  color: const Color(0xFFE4405F),
                  onTap: () {},
                ),
                const SizedBox(width: 16),
                _buildSocialButton(
                  icon: Icons.link_rounded,
                  color: const Color(0xFF1DA1F2),
                  onTap: () {},
                ),
              ],
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, Color textColor) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: textColor,
        ),
      ),
    );
  }

  Widget _buildContactCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required String contact,
    required Color color,
    required Color cardColor,
    required Color textColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: color,
                size: 28,
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
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    contact,
                    style: TextStyle(
                      fontSize: 15,
                      color: color,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              color: Colors.grey.shade400,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScheduleItem(String day, String time, Color textColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            day,
            style: TextStyle(
              fontSize: 15,
              color: textColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            time,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }
}