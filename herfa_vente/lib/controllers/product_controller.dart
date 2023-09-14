import 'package:herfa_vente/models/product.dart';

List<Product> products = [
  Product(
    id: 0,
    name: "Marteau",
    category: "Outillage",
    price: 1999,
    imageUrl: "images/products/marteau.jpg",
    images: [
      "images//products/marteau.jpg",
      "images/menuisier.jpg",
      "images/menuisier.jpg",
    ],
    ownerStatus: "artisant",
    productStatus: "used",
    details:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum",
  ),
  Product(
    id: 1,
    name: "Tournevis",
    category: "Autre",
    price: 2999,
    imageUrl: "images/products/tournevis.jpg",
    images: [
      "images/products/tournevis.jpg",
      "images/menuisier.jpg",
      "images/pub_image.jpg",
    ],
    ownerStatus: "artisant",
    productStatus: "used",
    details:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum",
  ),
  Product(
    id: 2,
    name: "Clé à molette",
    category: "Outillage",
    price: 1599,
    imageUrl: "images/products/cle_molette.jpg",
    images: [
      "images/products/cle_molette.jpg",
      "images/pub_image.jpg",
      "images/pub_image.jpg",
    ],
    ownerStatus: "magasin",
    productStatus: "used",
    details:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum",
  ),
  Product(
    id: 3,
    name: "Pince",
    category: "Outillage",
    price: 2499,
    imageUrl: "images/products/pince.jpg",
    images: [
      "images/products/pince.jpg",
      "images/pub_image.jpg",
      "images/menuisier.jpg",
    ],
    ownerStatus: "societe",
    productStatus: "not_used",
    details:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum",
  ),
  Product(
    id: 4,
    name: "Ciseaux à bois",
    category: "Outillage",
    price: 3999,
    imageUrl: "images/products/ciseaux_a_bois.jpg",
    images: [
      "images/products/ciseaux_a_bois.jpg",
      "images/menuisier.jpg",
      "images/pub_image.jpg",
    ],
    ownerStatus: "super_gros",
    productStatus: "not_used",
    details:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum",
  ),
  Product(
    id: 5,
    name: "Peinture murale",
    category: "Pienture",
    price: 999,
    imageUrl: "images/peinture.jpg",
    images: [
      "images/peinture.jpg",
      "images/pub_image.jpg",
      "images/menuisier.jpg",
    ],
    ownerStatus: "magasin",
    productStatus: "used",
    details:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum",
  ),
  Product(
    id: 6,
    name: "Papier de verre",
    category: "Outillage",
    price: 4499,
    imageUrl: "images/products/papier_verre.jpg",
    images: [
      "images/products/papier_verre.jpg",
      "images/menuisier.jpg",
      "images/pub_image.jpg",
    ],
    ownerStatus: "societe",
    productStatus: "not_used",
    details:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum",
  ),
  Product(
    id: 7,
    name: "Disjoncteurs",
    category: "Électricité",
    price: 3499,
    imageUrl: "images/products/disjoncteur.jpg",
    images: [
      "images/products/disjoncteur.jpg",
      "images/pub_image.jpg",
      "images/pub_image.jpg",
    ],
    ownerStatus: "super_gros",
    productStatus: "not_used",
    details:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum",
  ),
  Product(
    id: 8,
    name: "Scie circulaire",
    category: "placo",
    price: 3499,
    imageUrl: "images/products/scie_circulaire.jpg",
    images: [
      "images/products/scie_circulaire.jpg",
      "images/menuisier.jpg",
      "images/pub_image.jpg",
    ],
    ownerStatus: "magasin",
    productStatus: "used",
    details:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum",
  ),
  Product(
    id: 9,
    name: "Tôle ondulée",
    category: "Construction",
    price: 3499,
    imageUrl: "images/products/tole_ondulee.jpg",
    images: [
      "images/products/tole_ondulee.jpg",
      "images/pub_image.jpg",
      "images/pub_image.jpg",
    ],
    ownerStatus: "societe",
    productStatus: "used",
    details:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum",
  ),
  Product(
    id: 10,
    name: "Charnières",
    category: "Construction",
    price: 3499,
    imageUrl: "images/products/charnieres.jpg",
    images: [
      "images/products/charnieres.jpg",
      "images/pub_image.jpg",
      "images/menuisier.jpg",
    ],
    ownerStatus: "super_gros",
    productStatus: "not_used",
    details:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum",
  ),
  Product(
    id: 11,
    name: "Lunettes de protection",
    category: "Outils de sécurité",
    price: 3499,
    imageUrl: "images/products/lunettes_protection.jpg",
    images: [
      "images/products/lunettes_protection.jpg",
      "images/menuisier.jpg",
      "images/pub_image.jpg",
    ],
    ownerStatus: "artisant",
    productStatus: "not_used",
    details:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum",
  ),
    Product(
    id: 12,
    name: "Genouillères",
    category: "Autres",
    price: 3499,
    imageUrl: "images/products/genouilleres.jpg",
    images: [
      "images/products/genouilleres.jpg",
      "images/menuisier.jpg",
      "images/pub_image.jpg",
    ],
    ownerStatus: "artisant",
    productStatus: "not_used",
    details:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum",
  ),
    Product(
    id: 13,
    name: "Boussole",
    category: "Autres",
    price: 3499,
    imageUrl: "images/products/compas.jpg",
    images: [
      "images/products/compas.jpg",
      "images/menuisier.jpg",
      "images/pub_image.jpg",
    ],
    ownerStatus: "artisant",
    productStatus: "not_used",
    details:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum",
  ),
    Product(
    id: 14,
    name: "Joints d'étanchéité",
    category: "Plombier",
    price: 3499,
    imageUrl: "images/products/joints_d_etancheite.jpg",
    images: [
      "images/products/joints_d_etancheite.jpg",
      "images/menuisier.jpg",
      "images/pub_image.jpg",
    ],
    ownerStatus: "artisant",
    productStatus: "not_used",
    details:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum",
  ),
    Product(
    id: 15,
    name: "Tondeuse à gazon",
    category: "agriculture",
    price: 3499,
    imageUrl: "images/products/tondeuse_gazon.jpg",
    images: [
      "images/products/tondeuse_gazon.jpg",
      "images/menuisier.jpg",
      "images/pub_image.jpg",
    ],
    ownerStatus: "artisant",
    productStatus: "not_used",
    details:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum",
  ),
    Product(
    id: 16,
    name: "Brouette",
    category: "Outillage",
    price: 3499,
    imageUrl: "images/products/brouette.jpg",
    images: [
      "images/products/brouette.jpg",
      "images/menuisier.jpg",
      "images/pub_image.jpg",
    ],
    ownerStatus: "artisant",
    productStatus: "not_used",
    details:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum",
  ),
];
