abstract interface class IService<T> {
  Future<void> create(T item);
  Future<T?> findByID(String id);
  Future<List<T>> findAll();
  Future<void> update(String id, T updatedItem);
  Future<void> delete(String id);
  Future<void> deleteAll();
}
