import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final List<ExpandableItem> expandableItems = [
    ExpandableItem(
      title: 'The Importance of Reading',
      content:
      'Reading is a fundamental skill that opens up new worlds and opportunities. It allows us to gain knowledge, explore different perspectives, and enhance our imagination.',
    ),
    ExpandableItem(
      title: 'Benefits of Regular Exercise',
      content:
      'Regular exercise has numerous benefits for our physical and mental health. It helps improve cardiovascular health, reduce stress, and boost overall well-being.',
    ),
    ExpandableItem(
      title: 'Exploring Nature and Its Wonders',
      content:
      'Nature is full of wonders, from majestic mountains to intricate ecosystems. Exploring the outdoors allows us to connect with the natural world and appreciate its beauty.',
    ),
    ExpandableItem(
      title: 'The Art of Cooking and Creativity',
      content:
      'Cooking is not just about preparing food; it\'s a form of art and self-expression. It allows us to experiment with flavors and create delicious dishes.',
    ),
    ExpandableItem(
      title: 'Traveling and Broadening Horizons',
      content:
      'Traveling exposes us to different cultures, traditions, and people. It broadens our horizons, teaches us tolerance, and creates lasting memories.',
    ),
    ExpandableItem(
      title: 'The Joy of Music and Its Influence',
      content:
      'Music has the power to evoke emotions, inspire, and bring people together. Whether you\'re a musician or a listener, music enriches our lives.',
    ),
    ExpandableItem(
      title: 'The Impact of Technology on Society',
      content:
      'Technology has revolutionized the way we live and work. It has transformed industries, improved communication, and continues to shape our future.',
    ),
    ExpandableItem(
      title: 'The Beauty of Art and Self-Expression',
      content:
      'Art allows us to express our thoughts, emotions, and creativity. It comes in various forms, from painting and sculpture to dance and literature.',
    ),
    ExpandableItem(
      title: 'The Significance of Education',
      content:
      'Education is the key to personal growth and societal progress. It empowers individuals, fosters critical thinking, and drives innovation.',
    ),
    ExpandableItem(
      title: 'Caring for the Environment',
      content:
      'Protecting the environment is crucial for future generations. Sustainable practices and conservation efforts are essential to preserve our planet.',
    ),
    ExpandableItem(
      title: 'The Role of Family in Our Lives',
      content:
      'Family provides love, support, and a sense of belonging. Strong family bonds contribute to emotional well-being and personal development.',
    ),
    ExpandableItem(
      title: 'The Power of Positive Thinking',
      content:
      'A positive mindset can improve mental health, increase resilience, and lead to a more fulfilling life. It is a powerful tool for overcoming challenges.',
    ),
    ExpandableItem(
      title: 'Embracing Diversity and Inclusion',
      content:
      'Diversity enriches our communities and workplaces. Inclusion ensures that everyone feels valued and has equal opportunities for success.',
    ),
    ExpandableItem(
      title: 'The Joys of Parenthood',
      content:
      'Parenthood is a transformative journey filled with love, challenges, and personal growth. It brings joy, responsibility, and endless learning.',
    ),
    ExpandableItem(
      title: 'The Pursuit of Lifelong Learning',
      content:
      'Learning doesn\'t stop with formal education. Lifelong learning is a path to personal development, staying curious, and adapting to change.',
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Expandable List'),
            SizedBox(width: 10,),
            Icon(Icons.list_alt),
          ],
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: ListView.builder(
        itemCount: expandableItems.length,
        itemBuilder: (context, index) {
          final item = expandableItems[index];
          return InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              setState(() {
                item.isExpanded = !item.isExpanded;
              });
            },
            child: AnimatedContainer(
              margin: EdgeInsets.symmetric(
                horizontal: item.isExpanded ? 20 : 0,
                vertical: 10,
              ),
              padding: EdgeInsets.all(20),
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(milliseconds: 1200),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: item.isExpanded
                        ? Color(0xff6F12E8).withOpacity(0.5)
                        : Color(0xffFF5050).withOpacity(0.5),
                    blurRadius: 20,
                    offset: Offset(5, 10),
                  ),
                ],
                color: item.isExpanded ? Color(0xff6F12E8) : Color(0xffFF5050),
                borderRadius: BorderRadius.all(
                  Radius.circular(item.isExpanded ? 20 : 0),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          item.title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                            overflow: TextOverflow.clip
                          ),
                          maxLines: 1,
                        ),
                      ),
                      Icon(
                        item.isExpanded
                            ? Icons.keyboard_arrow_down
                            : Icons.keyboard_arrow_up,
                        color: Colors.white,
                        size: 27,
                      ),
                    ],
                  ),
                  AnimatedCrossFade(
                    firstChild: Text(
                      '',
                      style: TextStyle(
                        fontSize: 0,
                      ),
                    ),
                    secondChild: Text(
                      item.content,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.7,
                      ),
                    ),
                    // secondChild: Padding(
                    //   padding: const EdgeInsets.all(10.0),
                    //   child: ClipRRect(
                    //     borderRadius: BorderRadius.all(Radius.circular(20)),
                    //     child: Image.asset(
                    //       'assets/landscape.jpg', fit: BoxFit.fill, height: 300,
                    //     ),
                    //   ),
                    // ),
                    crossFadeState: item.isExpanded
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: Duration(milliseconds: 1200),
                    reverseDuration: Duration.zero,
                    sizeCurve: Curves.fastLinearToSlowEaseIn,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ExpandableItem {
  final String title;
  final String content;
  bool isExpanded;

  ExpandableItem({
    required this.title,
    required this.content,
    this.isExpanded = true,
  });
}
