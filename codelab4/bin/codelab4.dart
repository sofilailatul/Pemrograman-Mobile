import 'package:codelab4/codelab4.dart' as codelab4;

void main() {
  //Praktikum 1
  // final List<String?> list = List.filled(5, null); // List of strings with 5 elements, initially null

  // list[1] = 'Sofi Lailatul';
  // list[2] = '2241760073';

  // print(list);

  //Praktikum 2
  //var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  //print(halogens);

  // var names1 = <String>{};
  // Set<String> names2 = {}; // This works, too.
  // names1.add('Sofi Lailatul A');
  // names1.addAll({'2241760073', 'SIB 3E'});
  // names2.addAll({'Sofi Lailatul A', '2241760073'});

  // print(names1);
  // print(names2);

  //Praktikum 3
  // var gifts = {
  //   'first': 'partridge',
  //   'second': 'turtledoves',
  //   'fifth': 'golden rings',
  //   'nama': 'Sofi Lailatul',
  //   'nim': '2241760073'
  // };

  // var nobleGases = {
  //   2: 'helium',
  //   10: 'neon',
  //   18: 'argon',
  //   'nama': 'Sofi Lailatul',
  //   'nim': '2241760073'
  // };

  // var mhs1 = Map<String, String>();
  // mhs1['nama'] = 'Sofi Lailatul';
  // mhs1['nim'] = '2241760073';

  // var mhs2 = Map<String, String>();
  // mhs2['nama'] = 'Sofi Lailatul';
  // mhs2['nim'] = '2241760073';

  // print(gifts);
  // print(nobleGases);
  // print(mhs1);
  // print(mhs2);

  //Praktikum 4
  // Langkah 1
  //   var list = [1, 2, 3];
  //   var list2 = [0, ...list];
  //   print(list2);
  //   print(list2.length);

  //   // Langkah 3: Null-aware spread operator
  //   var list1 = [1, 2, null];
  //   var list3 = [0, ...?list1];
  //   print(list3); // Output: [0, 1, 2, null]
  //   var nimList = ['2', '2', '4', '1', '7', '6'];
  //   var studentInfo = ['Sofi Lailatul', ...nimList];
  //   print(studentInfo);

  //   // Langkah 4: Collection for dengan kondisi
  //   bool promoActive = true;
  //   var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  //   print(nav);

  //   // Langkah 5
  //   var login = 'Manager';
  //   var nav2 = ['Home', 'Furniture', 'Plants', if (login == 'Manager') 'Inventory'];
  //   print(nav2); // Output: [Home, Furniture, Plants, Inventory]

  //   //Langkah 6
  //   var listOfInts = [1, 2, 3];
  //   var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  //   assert(listOfStrings[1] == '#1');
  //   print(listOfStrings);
  //

  //Praktikum 5
  // Langkah 1
  var record = ('first', a: 2, b: true, 'last');
  print(record);

  // Langkah 4
  // Record type annotation in a variable declaration:
  (String nama, int nim) mahasiswa = ('Sofi Lailatul', 2241760073);
  print(mahasiswa);

  // Langkah 5
  var mahasiswa2 = ('first', a: 2, b: true, 'last');
  print(mahasiswa2.$1); // Prints 'first'
  print(mahasiswa2.a); // Prints 2
  print(mahasiswa2.b); // Prints true
  print(mahasiswa2.$2); // Prints 'last'
}

//lankah 3
(int, int) tukar((int, int) record) {
  var (a, b) = record;
  return (b, a);
}
