extension ListUpdate<T> on List<T>{

  List<T> update(T old,T updated,[int? index]){
    if(index == null){
      final itemIndex = indexOf(old);
      removeAt(itemIndex);
      insert(itemIndex, updated);
    }else{
      removeAt(index);
      insert(index, updated);
    }
    return this;
  }
}