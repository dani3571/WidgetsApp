import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// ! Creamos la data
class SlideInfo {
 final String title;
 final String caption;
 final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);

}

final slides = <SlideInfo>[
  SlideInfo('Busca la comida', 'Pariatur culpa excepteur ut sint do dolore non.', 'assets/images/1.png'),
  
  SlideInfo('Entrega la comida', 'Exercitation et exercitation culpa eu.', 'assets/images/2.png'),

  SlideInfo('Disfruta la comida', 'Eiusmod dolore anim cillum nisi Lorem elit ad voluptate mollit id et minim aute.', 'assets/images/3.png'),
  

];




class AppTutorialScreen extends StatefulWidget {
  // * Static para que no se creen instancias
  static const String name = 'tutorial_screen';

  const AppTutorialScreen ({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  // ! Agregamos la funcionalidad de controller
  late final PageController pageViewController = PageController();
  // * Bandera booleana para saber si llego al final del PageView()
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() { 
          final page = pageViewController.page ?? 0;
          // * Si endReached es true !endReached -> diferente de su valor predeterminado que es false que se muestre el boton
          // * Si slides es mayor a 1.5 que se muestre el boton
          if( !endReached && page >= (slides.length-1.5)){
              setState(() {
              endReached = true;
              });
          }
    });
  }
  // * Es como obligatorio usar le dispose ya que es parte del ciclo de vida del statefullWidget
  @override
  void dispose() {
    // ! Limpiamos los listener y limpiamos la memoria
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
            // * Controller es como la barra de reproduccion de youtube
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            // * Ponemos el contenido del PageView 
              children: slides.map((slideData) => _Slide(
                title: slideData.title, 
                caption: slideData.caption,
                imageUrl: slideData.imageUrl)
              ).toList(),
            
          ),
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
            onPressed: () => context.pop(),
            child: const Text('Salir'),
          )),
         // ! Este boton solo aparecera cuando lleguemos al final, si enReached es true que muestre el positioned si no que muestre el SizeBox
          (endReached) ?
          Positioned(
            bottom: 30, // * Mientras mas sea el valor mas alejado estara de la parte inferior
            right: 30,
            child: FadeInRight(
              from: 15,
              delay: const Duration(seconds: 1),
              child: FilledButton(
              onPressed:  () => context.pop(),
              child: const Text('Comenzar')),
            )
          ) : const SizedBox(), 
        
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(title, style: titleStyle,),
            const SizedBox(height: 10),
            Text(caption, style: captionStyle)
          ]
        ),
     ),
    );
  }
}