class TalkItem {
  final String title;
  final String event;
  final String url;
  final bool isChannel;

  const TalkItem({
    required this.title,
    required this.event,
    required this.url,
    this.isChannel = false,
  });
}

const String kSessionizeUrl = 'https://sessionize.com/kendi-jacqueline/';

final List<TalkItem> kTalks = [
  const TalkItem(
    title: "Beyond the PR",
    event: "Open Source Kigali",
    url: "https://www.youtube.com/watch?v=fARqxS04j3M",
  ),
  const TalkItem(
    title: "AR on Flutter: Merging Technologies for an Immersive Future",
    event: "Tech Talk",
    url: "https://www.youtube.com/watch?v=ZMFYj5_iFVM",
  ),
  const TalkItem(
    title: "Flutter Heroes",
    event: "Turin, Italy",
    url: "https://youtu.be/JeikLb73Gkk",
  ),
  const TalkItem(
    title: "Flutter Kenya Talks",
    event: "Testing, CI/CD & Interview Prep",
    url: "https://www.youtube.com/@flutterkenya",
    isChannel: true,
  ),
];
