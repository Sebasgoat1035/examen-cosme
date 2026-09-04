
import 'package:flutter/material.dart';

class Producto {
  const Producto({
    required this.nombre,
    required this.subtitulo,
    required this.descripcion,
    required this.precio,
    required this.imagenUrl,
    this.badge,
    this.isFavorite = false,
  });

  final String nombre;
  final String subtitulo;
  final String descripcion;
  final double precio;
  final String imagenUrl;
  final String? badge;
  final bool isFavorite;
}

const List<Producto> listaProductos = [
  Producto(
    nombre: 'Velvet Matte Lipstick',
    subtitulo: 'Ultra-Pigmented Finish',
    descripcion: 'Indulge in our most luxurious matte finish yet. Formulated with rare botanical oils and hyaluronic acid, this lipstick glides on like silk while providing high-impact color that lasts for 12 hours without drying.',
    precio: 24.00,
    imagenUrl: 'https://images.unsplash.com/photo-1586495777744-4413f21062fa?q=80&w=800&auto=format&fit=crop',
    badge: 'NEW',
    isFavorite: true,
  ),
  Producto(
    nombre: 'Silk Finish Foundation',
    subtitulo: 'Natural Coverage',
    descripcion: 'Lightweight foundation delivering seamless, buildable coverage with a luminous silk finish.',
    precio: 42.00,
    imagenUrl: 'https://images.unsplash.com/photo-1620916566398-39f1143ab7be?q=80&w=800&auto=format&fit=crop',
  ),
  Producto(
    nombre: 'Nude Dreams Palette',
    subtitulo: 'Multi-Finish Eyeshadow',
    descripcion: 'Versatile eyeshadow palette with velvety mattes and shimmering metallics.',
    precio: 38.00,
    imagenUrl: 'https://images.unsplash.com/photo-1512496015851-a90fb38ba796?q=80&w=800&auto=format&fit=crop',
    badge: 'BESTSELLER',
  ),
  Producto(
    nombre: 'Rose Glow Blush',
    subtitulo: 'Soft Powder Finish',
    descripcion: 'Radiant blush providing a natural pop of color with silky smooth application.',
    precio: 28.00,
    imagenUrl: 'https://images.unsplash.com/photo-1596462502278-27bfdc403348?q=80&w=800&auto=format&fit=crop',
    isFavorite: true,
  ),
  Producto(
    nombre: 'Hydrating Primer',
    subtitulo: 'Smooth Base',
    descripcion: 'Moisturizing face primer that locks in hydration and creates a flawless base.',
    precio: 35.00,
    imagenUrl: 'https://images.unsplash.com/photo-1556228720-195a672e8a03?q=80&w=800&auto=format&fit=crop',
  ),
  Producto(
    nombre: 'Long-wear Eyeliner',
    subtitulo: 'Precision Liquid Liner',
    descripcion: 'Waterproof liquid liner with a ultra-fine tip for crisp, smudge-proof lines.',
    precio: 22.00,
    imagenUrl: 'https://images.unsplash.com/photo-1631729371254-42c2892f0e6e?q=80&w=800&auto=format&fit=crop',
  ),
  Producto(
    nombre: 'Crystal Lip Gloss',
    subtitulo: 'High-Shine Formula',
    descripcion: 'Nourishing lip gloss delivering glass-like shine without any stickiness.',
    precio: 19.00,
    imagenUrl: 'https://images.unsplash.com/photo-1617897903246-719242758050?q=80&w=800&auto=format&fit=crop',
  ),
  Producto(
    nombre: 'Volume Lash Mascara',
    subtitulo: 'Dramatic Lift & Length',
    descripcion: 'Intense volumizing mascara that coats every lash for dramatic impact.',
    precio: 26.00,
    imagenUrl: 'https://images.unsplash.com/photo-1560700322-1d5d36e2f690?q=80&w=800&auto=format&fit=crop',
  ),
];

class PantallaCatalogo extends StatelessWidget {
  const PantallaCatalogo({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryPink = Color(0xFFEC268F);

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black87),
          onPressed: () {},
        ),
        title: RichText(
          text: const TextSpan(
            text: 'LUXE ',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              letterSpacing: 1,
            ),
            children: [
              TextSpan(
                text: 'BEAUTY',
                style: TextStyle(color: primaryPink),
              ),
            ],
          ),
        ),
        centerTitle: true,
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black87),
                onPressed: () {},
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: primaryPink,
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    '2',
                    style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search lipsticks, foundations...',
                    hintStyle: const TextStyle(color: Colors.black38, fontSize: 14),
                    prefixIcon: const Icon(Icons.search, color: primaryPink, size: 20),
                    filled: true,
                    fillColor: const Color(0xFFFFF0F5),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildTab('All Products', true, primaryPink),
                      _buildTab('Lipstick', false, primaryPink),
                      _buildTab('Foundation', false, primaryPink),
                      _buildTab('Eyeshadow', false, primaryPink),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.68,
                crossAxisSpacing: 14,
                mainAxisSpacing: 16,
              ),
              itemCount: listaProductos.length,
              itemBuilder: (context, index) {
                final prod = listaProductos[index];
                return GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/detalle', arguments: prod),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: NetworkImage(prod.imagenUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            if (prod.badge != null)
                              Positioned(
                                left: 8,
                                bottom: 8,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: prod.badge == 'NEW' ? primaryPink : const Color(0xFF37474F),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    prod.badge!,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 9,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            Positioned(
                              top: 8,
                              right: 8,
                              child: CircleAvatar(
                                radius: 14,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  prod.isFavorite ? Icons.favorite : Icons.favorite_border,
                                  size: 16,
                                  color: prod.isFavorite ? primaryPink : Colors.black38,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        prod.nombre,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '\$${prod.precio.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: primaryPink,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryPink,
        unselectedItemColor: Colors.black38,
        selectedLabelStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontSize: 10),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'SHOP'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'SEARCH'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'WISHLIST'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'PROFILE'),
        ],
      ),
    );
  }

  Widget _buildTab(String label, bool isSelected, Color activeColor) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.only(bottom: 6),
      decoration: BoxDecoration(
        border: isSelected
            ? Border(bottom: BorderSide(color: activeColor, width: 2))
            : null,
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? activeColor : Colors.black45,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
          fontSize: 13,
        ),
      ),
    );
  }
}