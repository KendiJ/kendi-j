import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kendy_j/consts/dimentions.dart';
import 'package:kendy_j/consts/projects_data.dart';
import 'package:kendy_j/consts/texts.dart';
import 'package:kendy_j/utils/link_launcher.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth > 1200
        ? kDesktopContentPadding
        : screenWidth * 0.15;

    return Column(
      children: [
        const SizedBox(height: kSectionSpacing),
        Text(
          Texts.projects,
          style: kTitleTextStyle,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 48),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isTwoColumn = constraints.maxWidth > 680;
              final cardWidth = isTwoColumn
                  ? (constraints.maxWidth - 24) / 2
                  : constraints.maxWidth;

              return Wrap(
                spacing: 24,
                runSpacing: 24,
                children: kProjects.map((project) {
                  return SizedBox(
                    width: cardWidth,
                    child: _ProjectCard(project: project),
                  );
                }).toList(),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final ProjectItem project;

  const _ProjectCard({required this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.teal.withValues(alpha: 0.35),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.teal.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title & Status Badge
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      project.title,
                      style: const TextStyle(
                        fontFamily: 'Delius',
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                  ),
                  if (project.statusBadge != null)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.teal.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.teal.withValues(alpha: 0.3),
                        ),
                      ),
                      child: Text(
                        project.statusBadge!,
                        style: GoogleFonts.patrickHand(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1B4D4D),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 12),
              // Description
              Text(
                project.description,
                style: GoogleFonts.patrickHand(
                  fontSize: 21,
                  height: 1.35,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),
              // Tags
              Wrap(
                spacing: 8,
                runSpacing: 6,
                children: project.tags.map((tag) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Text(
                      tag,
                      style: GoogleFonts.patrickHand(
                        fontSize: 15,
                        color: Colors.black87,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Action Button / Link
          _buildActionButton(context),
        ],
      ),
    );
  }

  Widget _buildActionButton(BuildContext context) {
    if (project.url != null) {
      return OutlinedButton.icon(
        onPressed: () => launchURL(project.url!),
        icon: Image.asset(
          'assets/icons/iconG.png',
          width: 20,
          height: 20,
        ),
        label: Text(
          project.actionLabel ?? 'View Repository',
          style: GoogleFonts.patrickHand(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.teal,
          side: const BorderSide(color: Colors.teal, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        ),
      );
    }

    // Projects without external link (e.g. backend service or tester-only)
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.teal.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.teal.withValues(alpha: 0.25)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            project.title.contains("API")
                ? Icons.terminal_rounded
                : Icons.android_rounded,
            size: 18,
            color: Colors.teal,
          ),
          const SizedBox(width: 8),
          Text(
            project.title.contains("API")
                ? "Backend Service"
                : "Internal Testing",
            style: GoogleFonts.patrickHand(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1B4D4D),
            ),
          ),
        ],
      ),
    );
  }
}
