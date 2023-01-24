import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../models/search_model.dart';
import '../../style/colors.dart';
import '../../style/text_style.dart';
import 'chats/widgets/online_img.dart';


class CategorySearch extends StatefulWidget {
  const CategorySearch({Key? key}) : super(key: key);

  @override
  State<CategorySearch> createState() => _CategorySearchState();
}

class _CategorySearchState extends State<CategorySearch> {
  String? dropdownValue;
 // List<SearchModel> searchList = <SearchModel>[];

  // List<SearchModel> searchList2 = <SearchModel>[];

  TextEditingController searchController = TextEditingController();
  String? filter = '';

  // var undropValue = 'null';
  bool hasData = true;

  @override
  void initState() {
    //getBook();
    searchController.addListener(() {
      filter = searchController.text;
      bool foundData = false;
      medicines.forEach((element) {
        if (element.name!.contains(filter!)) {
          hasData = true;
          foundData = true;
        }
      });

      if (foundData == false) {
        hasData = false;
      }

      setState(() {});
    });

    super.initState();
  }

  ///i don't need get mediciness from list because it already locally defined

  // getBook() async {
  //   // QuerySnapshot querySnapshot =
  //   // await FirebaseFirestore.instance.collection('books').get();
  //
  //   // for (var doc in querySnapshot.docs) {
  //   //   searchList.add(SearchModel(
  //   //
  //   //     name: doc['bookname'],
  //   //     imageurl: doc['imageurl'],
  //   //
  //   //   ));
  //   // }
  //   print(searchList);
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purpleAccent,
          title: Directionality(
            textDirection: TextDirection.rtl,
            child: TextFormField(
              controller: searchController,
              decoration: const InputDecoration(
                hintText: 'Enter the name of the medication',
                // hintStyle: labelStyle2,
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
          leadingWidth: 1,
          automaticallyImplyLeading: false,

        ),
        body: hasData
            ? ListView.builder(
          itemCount: medicines.length,
          itemBuilder: (context, index) {
            hasData = medicines[index]
                .name!
                .toLowerCase()
                .contains(filter!.toLowerCase());

            return medicines[index]
                .name!
                .toLowerCase()
                .contains(filter!.toLowerCase())
                ? _buildBookBox(
              medicines[index],
            )
                : Container();
          },
        )
            : Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(
                image: AssetImage('assets/booknot.png'), height: 200,),
              Text("There's no medicine in that name.",
                //  style: labelStyle2,
              ),
            ],
          ),
        ));
  }

  Widget _buildBookBox(SearchModel searchModel) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      Container()
                // BookDetailsSearch(
                // bookname: searchModel.bookname,
                // icon: Icons.add,
                // type: searchModel.type,
                // image: searchModel.imageurl,
                // rownum: searchModel.rownum,
                // colnum: searchModel.columnnum,
                // authname: searchModel.authorname,
                // aboutBook: searchModel.aboutBook,
                // id: searchModel.id)
              ));
        },
        child: Container(
          height: 70,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.white, blurRadius: 6)],
            border: Border.all(color: Colors.purple, width: 1.5),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              "${searchModel.name}",
              maxLines: 3,
              textAlign: TextAlign.center,
              // style: GoogleFonts.tajawal(
              //     textStyle: const TextStyle(
              //       fontSize: 24,
              //       fontWeight: FontWeight.w600,
              //       color: gray,
              //     )),
            ),
          ),
        ),
      ),
    );
  }
}

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // onTap: () {
      //   Navigator.of(context).push(
      //       MaterialPageRoute(builder: (context) => const ChatScreen()));
      // },
      tileColor: AppColor.card,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      selectedColor: AppColor.focuscolur,
     // leading: MyCircleAvatar(image: img, online: isnew),
    //  title: Text(name, style: AppTextStyles.boldnames),
      subtitle: Text("msg",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.greytxt),
      // trailing: Column(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [Text(date), isnew ? NewMsg() : SizedBox()],
      // ),
    );
  }
}

List<SearchModel> medicines = [
  SearchModel(imageurl: "antidiabetic",
      name: "antidiabetic"
  ),

  SearchModel(imageurl: "antihistamine",
      name: "antihistamine"
  ),

  SearchModel(imageurl: "declophein",
      name: "declophein"
  ),
  SearchModel(imageurl: "dolphein",
      name: "dolphein"
  ),
  SearchModel(imageurl: "panadol",
      name: "panadol"
  ),
  SearchModel(imageurl: "tylenol",
      name: "tylenol"
  ),

];


/*
[ range age,   n ,     dimeter ,     mm, main area ]
[ 10-20,       30 ,      20 ,        32,       30   ] 1
[ 10-20,       30 ,      20 ,        32,       30   ] 2
[ 10-20,       30 ,      20 ,        32,       30   ]
[ 10-20,       30 ,      20 ,        32,       30   ]
[ 10-20,       30 ,      20 ,        32,       30   ]
[ 10-20,       30 ,      20 ,        32,       30   ]
[ 10-20,       30 ,      20 ,        32,       30   ]
[ 10-20,       30 ,      20 ,        32,       30   ]
[ 10-20,       30 ,      20 ,        32,       30   ]
[ 10-20,       30 ,      20 ,        32,       30   ]

*/
// List eye = [];


// Map eyes = {
//   "first": {
//     "range": [20, 21, 22, 23],
//     "n": 30,
//     "dimeter": 55,
//     "mm": 40,
//     "main area": 20.1
//   },
//   "second": {
//     "range": [20, 21, 22, 23],
//     "n": 30,
//     "dimeter": 55,
//     "mm": 40,
//     "main area": 20.1
//   },
//   "third": {
//     "range": [20, 21, 22, 23],
//     "n": 30,
//     "dimeter": 55,
//     "mm": 40,
//     "main area": 20.1
//   },
//
// };