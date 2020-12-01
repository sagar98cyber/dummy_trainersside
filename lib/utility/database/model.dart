class room{
  String _rname;
  String _rrepeat;
  String _description;
  String _rtime;
  String _rlimit;
  String _rid;


  room.withid (this._rname,this._rlimit,this._rtime,this._rrepeat,this._rid,[this._description]);
  room(this._rname,this._rlimit,this._rtime,this._rrepeat,[this._description]);

  String get rid=>_rid;
  String get rname=>_rname;
  String get rrepeat=>_rrepeat;
  String get rdesc=>_description;
  String get rtime=>_rtime;
  String get rlimit=>_rlimit;

  set id(String newName)
  {

      this._rid=newName;

  }
  set name(String newName)
  {
    if(newName.length<15){
      this._rname=newName;
    }
  }
  set repeat(String newRepeat)
  {
    if(newRepeat.length<15){
      this._rrepeat=newRepeat;
    }
  }
  set description(String newDesc)
  {
    if(newDesc.length<15){
      this._description=newDesc;
    }
  }
  set time(String newRepeat)
  {
    if(newRepeat.length<15){
      this._rtime=newRepeat;
    }
  }
  set limit(String newName)
  {
    if(newName.length<15){
      this._rlimit=newName;
    }
  }

  Map<String,String> toMap(){
    var map = Map<String, dynamic>();
    if(rid!=null){
        map['rid']=_rid;
    }
    map['rname']=_rname;
    map['rrepeat']=_rrepeat;
    map['rdescription']=_description;
    map['rtime']=_rtime;
    map['rlimit']=_rlimit;
      return map;
  }

  room.fromMapObject(Map<String,dynamic> map){
      this._rid=map['rid'];
      this._rname=map['rname'];
      this._description=map['rdesc'];
      this._rtime=map['rtime'];
      this._rlimit=map['rlimit'];
  }


}