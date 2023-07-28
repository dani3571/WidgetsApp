import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class  InfiniteScrollScreen extends StatefulWidget {
  // * Static para que no se creen instancias
  static const String name = 'infinite_screen';

  const InfiniteScrollScreen ({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIds = [1,2,3,4,5];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;


  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      // ! Se cargaran las nuevas 5 imagenes antes de que se llegue al final del scroll
      // * Si la posicion en las que nos encontramos + 500 es mayor igual al scroll maximo

      if((scrollController.position.pixels + 500) >= scrollController.position.maxScrollExtent){
            // Cargamos la siguiente pagina
           // *Podriamos poner directo esta funcion aumentando el setState pero en este caso queremos hacerlo de forma asincrona
           // addFiveImages();

            loadNextPage();
      } 
    });
  }
  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }
  Future loadNextPage() async{
    // * Si es true que no cambie nada
    if(isLoading) return;
    isLoading = true;
    setState(() { });
    await Future.delayed(const Duration(seconds: 2));
    // Llamamos el addFiveImages()
    addFiveImages();
    isLoading = false;
     if(!isMounted) return
    setState(() {});

    // Todo: mover scrollç
    moveScrollToBottom();

  }

  Future <void> onRefresh() async{
    isLoading = true;
    setState(() {
      
    });
    await Future.delayed(const Duration(seconds: 3));
    if(!isMounted) return;
    isLoading = false;
    // * Recuperamos la ultima id
    final lastId = imagesIds.last;
    // * Limpiamos todas las id
    imagesIds.clear();
    // * añadimos nuevas segun el ultimo id + 1
    imagesIds.add(lastId+1);
    addFiveImages();
    setState(() {
      
    });

  }
  void moveScrollToBottom(){
    // * Funcion para que cuando el scroll este hasta la ultima imagen y se este cargando la siguiente imagen se mueva un poco automaticamente
      if(scrollController.position.pixels + 100 <= scrollController.position.maxScrollExtent) return;
      scrollController.animateTo(
        scrollController.position.pixels + 120,  
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn
      );
  }

  void addFiveImages(){
    final lastId = imagesIds.last;
    // *Cargamos 5 ids nuevas
    imagesIds.addAll(
      [1,2,3,4,5].map((e) => lastId + e)
    );
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: Colors.black,
      // * Con mediaQueryRemove eliminamos el padding de la pantalla default
      body: MediaQuery.removePadding(
        // * Pasamos el contexto y removemos la parte de arriba y abajo
        context: context,
        removeTop: true,
        removeBottom: true,
        // ! El widget de abajo nos sirve para refrescar las imagenes
        child: RefreshIndicator(
          onRefresh: () => onRefresh(),
          edgeOffset: 10,
          strokeWidth: 2,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesIds.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
                // * Este gif se mostrara antes de que se cargue la imagen
                placeholder: const AssetImage('assets/images/jar-loading.gif'),
                image: NetworkImage('https://picsum.photos/id/${ imagesIds[index] }/500/300'),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
         
        child: isLoading ? 
        SpinPerfect(
          infinite: true,
          child: const Icon(Icons.refresh_rounded)  
        ) 
        //* FadeIn para que aparezca poco a poco en estilo de animacion
        :FadeIn(child: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
    );
  }
}