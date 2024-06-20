
/// CATEGORY MODEL CLASS>>>>
class categorymodel{
  String id;
  String name;
  String photo;
  categorymodel(this.id,this.name,this.photo);
}

/// ADMIN MODEL CLASS>>>>>
class recipeaddmodel{
  String id;
  String userId;
  String name;// recipe name
  List   photo;
  String category;
  String direction;
  String time;
  String incredient;
  String incredient1;
  String categoryid;
  String addedby;
 
    recipeaddmodel(this.id,this.name,this.photo,this.category,this.direction,this.time,this.incredient,this.incredient1,this.categoryid,this.addedby,this.userId);

}

class registermodel{
  String id;
  String name;
  String phone;
  String status;
  String photo;
  registermodel(this.id,this.name,this.phone,this.status,this.photo);
}


class carouseladdmodel{
  String id;
  String name;
  String photo;
  String addby;
  carouseladdmodel(this.id,this.name,this.photo, this.addby);
}

/// USER MODEL CLASS>>>
class useraddrecipemodel{
  String userid;
  String id;
  String name;
  List   photo;
  String category;
  String direction;
  String time;
  String incredient;
  String incredient1;
  String categoryid;
  String addedby;

  useraddrecipemodel(this.userid, this.id,this.name,this.photo,this.category,this.direction,this.time,this.incredient,this.incredient1,this.categoryid,this.addedby,);
}

// review model -------->
class ReviewModel{
  String userid;
  String id;
  String name;
  String time;
  String review;
  String photo;
  String recId;
 ReviewModel(this.userid,this.id,this.name,this.time,this.review,this.photo,this.recId);

}