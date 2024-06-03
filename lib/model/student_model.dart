class studentModel{
   int? id;
  String? name;
  String? email;
  String? phone;
  String? age;


  studentModel({this.id,this.name,this.email,this.phone,this.age});
  //creat model into map
  Map<String,dynamic>ModeltoMap(){
    return {
      // "id":id,
      'name': name,
      'email':email,
      'phone': phone,
      'age':age
    };
  }
  //creat map into model
  factory studentModel.MaptoModel(
      Map<String,dynamic> data){
    return studentModel(
        id: data['id'],
      name: data['name'],
      email: data['email'],
      phone: data['phone'],
      age: data['age']
    );
  }
}