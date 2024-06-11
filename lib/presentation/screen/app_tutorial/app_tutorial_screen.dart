import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
      'Busca la comida',
      'Dolore sint quis nulla aute labore laborum ex. Lorem qui excepteur consectetur reprehenderit dolor aute pariatur pariatur culpa non quis. Excepteur ea quis cillum laboris minim esse minim id nisi commodo do qui magna ut. Irure elit velit nostrud eu nostrud nostrud cupidatat. Ex do sunt commodo deserunt tempor et culpa Lorem anim magna proident dolore Lorem nulla.',
      'assets/images/1.png'),
  SlideInfo(
      'Entrega rápida',
      'Magna fugiat est deserunt sunt ullamco consectetur sint quis occaecat aute irure dolore. Culpa consequat magna ea amet proident. Cupidatat esse enim aliquip labore.',
      'assets/images/2.png'),
  SlideInfo(
      'Disfruta la comida',
      'Ullamco aliquip fugiat aliquip sint est consectetur esse occaecat proident do eiusmod laboris sunt anim. Do aliqua sunt deserunt elit sunt. Cillum enim eu nostrud incididunt incididunt laboris eu. Culpa id officia laborum ea.',
      'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  
  const AppTutorialScreen({super.key});

  static const String name = 'app_tutorial_screen';

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {

      final page = pageViewController.page ?? 0;
      if( !endReached && page >= (slides.length - 1.5 )) {
        setState(() {
          endReached = true;
        });
      } else if (endReached && page < (slides.length - 1.5)) {
        setState(() {
          endReached = false;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Stack(
          children: [
            PageView(
                  controller: pageViewController,
                  physics: const BouncingScrollPhysics(),
                  children: slides
              .map((slideData) => _Slide(
                  title: slideData.title,
                  caption: slideData.caption,
                  imageUrl: slideData.imageUrl))
              .toList(),
                ),

            Positioned(
              right: 20,
              top: 50,
              child: TextButton(
                child: const Text('Skip'),
                onPressed: () => context.pop(),
              ),
            ),
            endReached ? Positioned(
              bottom: 30,
              right: 30,
              child: FilledButton(onPressed: () => context.pop(),
            child: const Text('Comenzar'),
            )
            ): const SizedBox()
          ],
        ));
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;

    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(title, style: titleStyle),
            const SizedBox(height: 10),
            Text(caption, style: captionStyle),

          ],),
      ),
    );
  }
}
