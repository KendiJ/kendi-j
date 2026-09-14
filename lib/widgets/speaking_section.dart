import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kendy_j/consts/dimentions.dart';
import 'package:kendy_j/consts/speaking_data.dart';
import 'package:kendy_j/consts/texts.dart';
import 'package:kendy_j/utils/link_launcher.dart';

class SpeakingSection extends StatelessWidget {
  const SpeakingSection({super.key});

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
          Texts.speaking,
          style: kTitleTextStyle,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 40),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Column(
            children: [
              // Sessionize Hub Anchor Card
              const _SessionizeAnchorCard(),
              const SizedBox(height: 28),
              // Responsive 2x2 grid of talks
              LayoutBuilder(
                builder: (context, constraints) {
                  final isTwoColumn = constraints.maxWidth > 680;
                  final cardWidth = isTwoColumn
                      ? (constraints.maxWidth - 20) / 2
                      : constraints.maxWidth;

                  return Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: kTalks.map((talk) {
                      return SizedBox(
                        width: cardWidth,
                        child: _TalkCard(talk: talk),
                      );
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SessionizeAnchorCard extends StatelessWidget {
  const _SessionizeAnchorCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.teal.withValues(alpha: 0.45),
          width: 1.8,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.teal.withValues(alpha: 0.08),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isCompact = constraints.maxWidth < 620;

          final infoContent = Row(
            children: [
              Image.asset(
                'assets/icons/iconS.png',
                width: 44,
                height: 44,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Speaker Profile & Sessions",
                      style: TextStyle(
                        fontFamily: 'Delius',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Talk abstracts, upcoming conferences, and speaking history.",
                      style: GoogleFonts.patrickHand(
                        fontSize: 18,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );

          final actionButton = OutlinedButton.icon(
            onPressed: () => launchURL(kSessionizeUrl),
            icon: const Icon(Icons.arrow_forward_rounded, size: 18, color: Colors.teal),
            label: Text(
              "See all my talks on Sessionize →",
              style: GoogleFonts.patrickHand(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.teal,
              side: const BorderSide(color: Colors.teal, width: 1.6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            ),
          );

          if (isCompact) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                infoContent,
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: actionButton,
                ),
              ],
            );
          }

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: infoContent),
              const SizedBox(width: 20),
              actionButton,
            ],
          );
        },
      ),
    );
  }
}

class _TalkCard extends StatelessWidget {
  final TalkItem talk;

  const _TalkCard({required this.talk});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.teal.withValues(alpha: 0.3),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.teal.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 3),
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
              // Event pill badge
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 3,
                ),
                decoration: BoxDecoration(
                  color: Colors.teal.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.teal.withValues(alpha: 0.25),
                  ),
                ),
                child: Text(
                  talk.event,
                  style: GoogleFonts.patrickHand(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1B4D4D),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Talk Title
              Text(
                talk.title,
                style: const TextStyle(
                  fontFamily: 'Delius',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                  height: 1.25,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Watch Talk / Visit Channel button
          OutlinedButton.icon(
            onPressed: () => launchURL(talk.url),
            icon: Image.asset(
              'assets/icons/iconY.png',
              width: 20,
              height: 20,
            ),
            label: Text(
              talk.isChannel ? 'Visit Channel ↗' : 'Watch Talk ↗',
              style: GoogleFonts.patrickHand(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.teal,
              side: const BorderSide(color: Colors.teal, width: 1.4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            ),
          ),
        ],
      ),
    );
  }
}
