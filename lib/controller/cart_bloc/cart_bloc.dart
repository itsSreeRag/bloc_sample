import 'package:bloc/bloc.dart';
import 'package:bloc_sample/model/dummy_api_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<AddCartButtonPress>(_onItemAdd);
  }

  void _onItemAdd(AddCartButtonPress event,Emitter<CartState> emit){
    List<ProductModel>currentItems=[];

    if(state is CartListState){
      currentItems=(state as CartListState).cartList;
    }

    currentItems.add(event.newItem);
    
    emit(CartListState(cartList: List.from(currentItems)));
  }
}
