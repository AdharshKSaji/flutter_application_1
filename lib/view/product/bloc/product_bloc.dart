import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/model/productmodel.dart';
import 'package:flutter_application_1/view/api/piservice.dart';


part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final Apiservice apiService;

  ProductBloc(this.apiService) : super(ProductInitial(productlist: [])) {
    on<FetchProductsEvent>(_onFetchProductsEvent);
  }

  Future<void> _onFetchProductsEvent(
      FetchProductsEvent event, Emitter<ProductState> emit) async {
    emit(ProductLoading()); // Emit loading state before fetching

    try {
      var list = await apiService.fetchData();
      emit(ProductLoaded(productlist: list));
    } catch (e) {
      emit(ProductError(message: e.toString()));
    }
  }
}
