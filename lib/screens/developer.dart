import 'package:proj/widgets/details_title.dart';
import 'package:flutter/material.dart';

import 'package:proj/widgets/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class DeveloperPage extends StatelessWidget {
  const DeveloperPage({required Key key}) : super(key: key);

  Future<void> _launchUrl(String b) async {
    final Uri url = Uri.parse(b);
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $b');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ayekaunic@gmail.com'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RoundedImage(
                asset: 'assets/images/priorities.jpg',
                key: UniqueKey(),
              ),
              SizedBox(height: 16.0),
              Text('Muhammad Aun',
                  style: Theme.of(context).textTheme.headlineMedium),
              SizedBox(height: 16.0),
              Container(
                width: double.infinity,
                child: DetailsTitle(title: 'About Me'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(
                  "Hello there! Thank you for using my app! A little about myself: I'm a rising senior at The IBA Karachi who loves to LeetCode, run around, play football and go to the gym every once in a while. I'm also a sucker for a good nap (although to be fair, it doesn't take a genius to figure that one out😅).",
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  DetailsTitle(title: 'My Links'),
                ],
              ),
              SizedBox(height: 8.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(
                  'Feel free to contact me regarding a bug, or any criticism that you might have. Or maybe just to talk about coding or life in general.😄',
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.justify,
                ),
              ),
              DevLink(
                icon: FontAwesomeIcons.github,
                label: 'GitHub',
                onPressed: () {
                  _launchUrl('https://github.com/ayekaunic');
                },
                key: UniqueKey(),
              ),
              DevLink(
                icon: FontAwesomeIcons.linkedin,
                label: 'LinkedIn',
                onPressed: () {
                  _launchUrl('https://www.linkedin.com/in/ayekaunic/');
                },
                key: UniqueKey(),
              ),
              DevLink(
                icon: FontAwesomeIcons.facebook,
                label: 'Facebook',
                onPressed: () {
                  _launchUrl('https://www.facebook.com/ayekaunic/');
                },
                key: UniqueKey(),
              ),
              DevLink(
                icon: FontAwesomeIcons.twitter,
                label: 'Twitter',
                onPressed: () {
                  _launchUrl('https://twitter.com/ayekaunic');
                },
                key: UniqueKey(),
              ),
              DevLink(
                icon: FontAwesomeIcons.instagram,
                label: 'Instagram',
                onPressed: () {
                  _launchUrl('https://www.instagram.com/ayekaunic/');
                },
                key: UniqueKey(),
              ),
              DevLink(
                icon: FontAwesomeIcons.solidEnvelope,
                label: 'Send Email',
                onPressed: () {
                  _launchUrl(
                      'mailto:ayekaunic@gmail.com?subject=Reason%20you%20are%20contacting%20me&body=Hello%20Aun%21');
                },
                key: UniqueKey(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
