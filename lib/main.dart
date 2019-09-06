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
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image(
              image: AssetImage('images/logo-rgembonghappy.png'),
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.list),
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
        bottomNavigationBar: makeBottom,
      ),
    );
  }
}

class Meal {
  const Meal({this.title, this.desc, this.image});

  final String title;
  final String desc;
  final String image;
}

const List<Meal> meals = const <Meal>[
  const Meal(
      title: 'Coklat Keju',
      desc:
          'Nikmatnya coklat bercampur gurihnya keju dan susu, membuatmu ingin lagi dan lagi',
      image: 'coklat_keju.jpg'),
  const Meal(
      title: 'Coklat',
      desc:
          'Manisnya coklat dalam balutan roti yang lembut akan membuatmu jadi lebih semangat',
      image: 'coklat.jpg'),
  const Meal(
      title: 'Tiramisu',
      desc: 'Rasa ini akan selalu mambuatmu rindu gaess...',
      image: 'tira.jpg'),
  const Meal(
      title: 'Cappucino',
      desc: 'Cara baru ngopi dalam bentuk roti',
      image: 'cappucino.jpg'),
  const Meal(
      title: 'Green Tea',
      desc: 'Akan membuat hari-harimu menjadi seger',
      image: 'grinti.jpg'),
  const Meal(
      title: 'Srikaya',
      desc: 'Rasa yang dulu pernah ada kini hadir kembali',
      image: 'srikaya.jpg'),
  const Meal(
      title: 'Keju Susu',
      desc: 'Parutan Keju yang gurih dan bikin nagih',
      image: 'keju.jpg'),
  const Meal(
      title: 'Original',
      desc: 'Roti Asli Samarinda yang penuh cinta dan bikin bahagia',
      image: 'original.jpg'),
  const Meal(title: 'GemPi', desc: '', image: 'gempi2.jpg'),
  const Meal(
      title: 'Mentega Gula',
      desc: 'Rasa nostalgia saat nenek masih remaja',
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
            FlatButton(
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
              child: Image(
                image: AssetImage('images/' + widget.meal.image),
                width: 100.0,
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
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image(
                  image: AssetImage('images/' + meal.image),
                ),
              ),
              Text(
                meal.desc,
                style: TextStyle(fontFamily: 'Source Sans Pro', fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                child: Text('Kembali ke Daftar Meal'),
                color: Colors.red[200],
                onPressed: () => Navigator.pop(context),
              )
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
