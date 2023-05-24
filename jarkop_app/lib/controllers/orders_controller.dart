import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:jarkop_app/models/orders_model.dart';

class OrdersController extends GetxController {
  final _db = FirebaseFirestore.instance;
  final _firestore = FirebaseFirestore.instance;
  RxList<OrdersModel> recapList = RxList<OrdersModel>([]);
  RxBool isLoading = false.obs;
  List<OrdersModel> get recaps => recapList.value;
  @override
  void onInit() {
    fetchRecap();
    super.onInit();
  }

  void setRecapList(OrdersModel recap) {
    recapList.add(recap);
    update();
  }

  Future<void> fetchRecap() async {
    try {
      isLoading(true);
      update();
 
      final response =
          await _db.collection('orders').get();
      final List<OrdersModel> loadedRecaps = [];
      response.docs.forEach((recap) {
        loadedRecaps.add(OrdersModel.fromFirestore(recap));
      });
      recapList.value = loadedRecaps;
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
      update();
    }
  }
}