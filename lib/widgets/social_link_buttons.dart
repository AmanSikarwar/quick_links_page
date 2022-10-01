import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialLinkButtons extends StatelessWidget {
  const SocialLinkButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.email),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.phone),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.web),
          onPressed: () {},
        ),
      ],
    );
  }
}

class SocialLinkButton extends StatelessWidget {
  const SocialLinkButton({
    super.key,
    this.backgroundColor,
    required this.icon,
    this.iconColor,
    this.label,
    required this.link,
    this.onPressed,
    this.tooltip,
  });

  final Color? backgroundColor;
  final IconData icon;
  final Color? iconColor;
  final String? label;
  final String link;
  final VoidCallback? onPressed;
  final String? tooltip;

  SocialLinkButton.facebook({
    super.key,
    this.onPressed,
    this.label,
    this.tooltip,
    required this.link,
  })  : backgroundColor = const Color(0xFF3B5998),
        icon = FontAwesomeIcons.facebookF,
        iconColor = Colors.white,
        assert(link.startsWith('https://www.facebook.com/'));

  SocialLinkButton.twitter({
    super.key,
    this.onPressed,
    this.label,
    this.tooltip,
    required this.link,
  })  : backgroundColor = const Color(0xFF1DA1F2),
        icon = FontAwesomeIcons.twitter,
        iconColor = Colors.white,
        assert(link.startsWith('https://twitter.com/'));

  SocialLinkButton.instagram({
    super.key,
    this.onPressed,
    this.label,
    this.tooltip,
    required this.link,
  })  : backgroundColor = const Color(0xFFE1306C),
        icon = FontAwesomeIcons.instagram,
        iconColor = Colors.white,
        assert(link.startsWith('https://www.instagram.com/'));

  SocialLinkButton.linkedin({
    super.key,
    this.onPressed,
    this.label,
    this.tooltip,
    required this.link,
  })  : backgroundColor = const Color(0xFF0077B5),
        icon = FontAwesomeIcons.linkedinIn,
        iconColor = Colors.white,
        assert(link.startsWith('https://www.linkedin.com/'));

  SocialLinkButton.github({
    super.key,
    this.onPressed,
    this.label,
    this.tooltip,
    required this.link,
  })  : backgroundColor = const Color(0xFF333333),
        icon = FontAwesomeIcons.github,
        iconColor = Colors.white,
        assert(link.startsWith('https://github.com/'));

  SocialLinkButton.youtube({
    super.key,
    this.onPressed,
    this.label,
    this.tooltip,
    required this.link,
  })  : backgroundColor = const Color(0xFFCD201F),
        icon = FontAwesomeIcons.youtube,
        iconColor = Colors.white,
        assert(link.startsWith('https://www.youtube.com/'));

  SocialLinkButton.medium({
    super.key,
    this.onPressed,
    this.label,
    this.tooltip,
    required this.link,
  })  : backgroundColor = const Color(0xFF00AB6C),
        icon = FontAwesomeIcons.medium,
        iconColor = Colors.white,
        assert(link.startsWith('https://medium.com/') ||
            link.contains('.medium.com'));

  SocialLinkButton.stackoverflow({
    super.key,
    this.onPressed,
    this.label,
    this.tooltip,
    required this.link,
  })  : backgroundColor = const Color(0xFFFE7A16),
        icon = FontAwesomeIcons.stackOverflow,
        iconColor = Colors.white,
        assert(link.startsWith('https://stackoverflow.com/'));

  SocialLinkButton.quora({
    super.key,
    this.onPressed,
    this.label,
    this.tooltip,
    required this.link,
  })  : backgroundColor = const Color(0xFFA82400),
        icon = FontAwesomeIcons.quora,
        iconColor = Colors.white,
        assert(link.startsWith('https://www.quora.com/'));

  SocialLinkButton.reddit({
    super.key,
    this.onPressed,
    this.label,
    this.tooltip,
    required this.link,
  })  : backgroundColor = const Color(0xFFFF4500),
        icon = FontAwesomeIcons.redditAlien,
        iconColor = Colors.white,
        assert(link.startsWith('https://www.reddit.com/'));

  SocialLinkButton.snapchat({
    super.key,
    this.onPressed,
    this.label,
    this.tooltip,
    required this.link,
  })  : backgroundColor = const Color(0xFFFFFC00),
        icon = FontAwesomeIcons.snapchat,
        iconColor = Colors.black,
        assert(link.startsWith('https://www.snapchat.com/'));

  SocialLinkButton.whatsapp({
    super.key,
    this.onPressed,
    this.label,
    this.tooltip,
    required this.link,
  })  : backgroundColor = const Color(0xFF25D366),
        icon = FontAwesomeIcons.whatsapp,
        iconColor = Colors.white,
        assert(link.startsWith('https://wa.me/'));

  SocialLinkButton.telegram({
    super.key,
    this.onPressed,
    this.label,
    this.tooltip,
    required this.link,
  })  : backgroundColor = const Color(0xFF0088CC),
        icon = FontAwesomeIcons.telegram,
        iconColor = Colors.white,
        assert(link.startsWith('https://t.me/'));

  @override
  Widget build(BuildContext context) {
    if (label != null) {
      return Tooltip(
        message: tooltip ?? label!,
        child: TextButton.icon(
          icon: Icon(
            icon,
            color: iconColor,
          ),
          label: Text(label!),
          onPressed: onPressed ?? () => launchUrl(Uri.parse(link)),
          style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
          ),
        ),
      );
    } else {
      return Tooltip(
        message: tooltip ?? link,
        child: IconButton(
          icon: Icon(
            icon,
            color: iconColor,
          ),
          onPressed: onPressed ?? () => launchUrl(Uri.parse(link)),
          style: IconButton.styleFrom(
            backgroundColor: backgroundColor,
          ),
        ),
      );
    }
  }
}
