import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = "Roti Gembong Happy Store";

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.1,
          title: Text(title),
          backgroundColor: Colors.redAccent,
          /*leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image(
              image: AssetImage('images/logo-rgembonghappy.png'),
            ),
          ),*/
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {},
            )
          ],
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(meals.length, (index) {
            return Center(
              //child: MealCard(meal: meals[index]),
              child: ListMakanan(
                meal: meals[index],
              ),
            );
          }),
        ),
        drawer: makeDrawer,
        bottomNavigationBar: makeBottom,
      ),
    );
  }
}

class Meal {
  const Meal({this.title, this.desc, this.bahan, this.image});

  final String title;
  final String desc;
  final String bahan;
  final String image;
}

const List<Meal> meals = const <Meal>[
  const Meal(
      title: 'Coklat Keju',
      desc:
          'Nikmatnya coklat bercampur gurihnya keju dan susu, membuatmu ingin lagi dan lagi',
      bahan:
          'Tepung dengan protein tinggi, gula pasir, telur ayam negeri, susu sapi segar dan margarin terbaik',
      image: 'coklat_keju.jpg'),
  const Meal(
      title: 'Coklat',
      desc:
          'Manisnya coklat dalam balutan roti yang lembut akan membuatmu jadi lebih semangat',
      bahan:
          'Tepung dengan protein tinggi, gula pasir, telur ayam negeri, susu sapi segar dan margarin terbaik',
      image: 'coklat.jpg'),
  const Meal(
      title: 'Tiramisu',
      desc: 'Rasa ini akan selalu mambuatmu rindu gaess...',
      bahan:
          'Tepung dengan protein tinggi, gula pasir, telur ayam negeri, susu sapi segar dan margarin terbaik',
      image: 'tira.jpg'),
  const Meal(
      title: 'Cappucino',
      desc: 'Cara baru ngopi dalam bentuk roti',
      bahan:
          'Tepung dengan protein tinggi, gula pasir, telur ayam negeri, susu sapi segar dan margarin terbaik',
      image: 'cappucino.jpg'),
  const Meal(
      title: 'Green Tea',
      desc: 'Akan membuat hari-harimu menjadi seger',
      bahan:
          'Tepung dengan protein tinggi, gula pasir, telur ayam negeri, susu sapi segar dan margarin terbaik',
      image: 'grinti.jpg'),
  const Meal(
      title: 'Srikaya',
      desc: 'Rasa yang dulu pernah ada kini hadir kembali',
      bahan:
          'Tepung dengan protein tinggi, gula pasir, telur ayam negeri, susu sapi segar dan margarin terbaik',
      image: 'srikaya.jpg'),
  const Meal(
      title: 'Keju Susu',
      desc: 'Parutan Keju yang gurih dan bikin nagih',
      bahan:
          'Tepung dengan protein tinggi, gula pasir, telur ayam negeri, susu sapi segar dan margarin terbaik',
      image: 'keju.jpg'),
  const Meal(
      title: 'Original',
      desc: 'Roti Asli Samarinda yang penuh cinta dan bikin bahagia',
      bahan:
          'Tepung dengan protein tinggi, gula pasir, telur ayam negeri, susu sapi segar dan margarin terbaik',
      image: 'original.jpg'),
  const Meal(
      title: 'GemPi',
      desc: 'Roti Gembong serasa Pizza yang ngilangin laparmu..',
      bahan:
          'Tepung dengan protein tinggi, gula pasir, telur ayam negeri, susu sapi segar dan margarin terbaik',
      image: 'gempi2.jpg'),
  const Meal(
      title: 'Mentega Gula',
      desc: 'Rasa nostalgia saat nenek masih remaja',
      bahan:
          'Tepung dengan protein tinggi, gula pasir, telur ayam negeri, susu sapi segar dan margarin terbaik',
      image: 'mentgul.jpg'),
  const Meal(title: 'Durian', desc: '', image: 'logo-rgembonghappy.png'),
];

class DaftarMeal extends StatelessWidget {
  const DaftarMeal({Key key, this.meal}) : super(key: key);
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage('images/' + meal.image),
              width: 80.0,
            ),
            Text(meal.title)
          ],
        ),
      ),
    );
  }
}

class ListMakanan extends StatefulWidget {
  final Meal meal;
  ListMakanan({Key key, this.meal}) : super(key: key);

  _ListMakananState createState() => _ListMakananState();
}

class _ListMakananState extends State<ListMakanan> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailMakanan(
                                meal: widget.meal,
                              ))).then((Object result) {
                    print('result from DetailMakanan ${result.toString()}');
                  });
                  print(widget.meal.title + ' got pressed!');
                },
                child: Image(image: AssetImage('images/' + widget.meal.image)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.meal.title,
                style: TextStyle(
                    fontFamily: 'Source Sans Pro', fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DetailMakanan extends StatelessWidget {
  const DetailMakanan({Key key, this.meal}) : super(key: key);
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rasa Pilihan'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                '.: ' + meal.title + ' :.',
                style: TextStyle(fontSize: 30.0, fontFamily: 'Pacifico'),
              ),
              Expanded(
                child: Image(
                  image: AssetImage('images/' + meal.image),
                ),
              ),
              Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      meal.desc,
                      style: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Divider(),
                    Text(
                      'Terbuat dari: ' + meal.bahan,
                      style: TextStyle(
                          fontFamily: 'Source Sans Pro', fontSize: 20.0),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    RaisedButton(
                      child: Text('Kembali ke Daftar Meal'),
                      color: Colors.red[200],
                      onPressed: () => Navigator.pop(context),
                    )
                  ])
            ],
          ),
        ),
      ),
    );
  }
}

final makeBottom = Container(
  height: 55.0,
  child: BottomAppBar(
    color: Colors.redAccent,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.home, color: Colors.white),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.blur_on, color: Colors.white),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.shopping_cart, color: Colors.white),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.account_box, color: Colors.white),
          onPressed: () {},
        )
      ],
    ),
  ),
);

final makeDrawer = Drawer(
  elevation: 20.0,
  child: ListView(
    padding: EdgeInsets.zero,
    children: <Widget>[
      UserAccountsDrawerHeader(
        accountName: Text('Indra Wahyudi'),
        accountEmail: Text('neodayax@gmail.com'),
        currentAccountPicture: Image.asset('images/logo-rgembonghappy.png'),
        decoration: BoxDecoration(color: Colors.red[300]),
      ),
    ],
  ),
);
