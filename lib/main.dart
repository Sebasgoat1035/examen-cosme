import 'package:flutter/material.dart';
import 'login.dart';
import 'productos.dart';
import 'productodetalle.dart';

void main() {
  runApp(const LuxeBeautyApp());
}

class LuxeBeautyApp extends StatelessWidget {
  const LuxeBeautyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LUXE BEAUTY',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFEC268F),
          primary: const Color(0xFFEC268F),
        ),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (_) => const PantallaInicioSesion(),
            );
          case '/catalogo':
            return MaterialPageRoute(builder: (_) => const PantallaCatalogo());
          case '/detalle':
            final producto = settings.arguments as Producto;
            return _rutaDetalle(producto);
          default:
            return MaterialPageRoute(
              builder: (_) => const Scaffold(
                body: Center(child: Text('Ruta no encontrada')),
              ),
            );
        }
      },
    );
  }

  static PageRouteBuilder<void> _rutaDetalle(Producto producto) {
    return PageRouteBuilder<void>(
      pageBuilder: (_, _, _) => PantallaDetalleProducto(producto: producto),
      transitionsBuilder: (_, animation, _, child) {
        final curva = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
        );
        return FadeTransition(
          opacity: curva,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.08, 0),
              end: Offset.zero,
            ).animate(curva),
            child: child,
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 350),
    );
  }
}
