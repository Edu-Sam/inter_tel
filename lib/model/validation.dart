
class Validation{

  String field_tag='Field is required',
      special_tag='No special characters allowed in field',
      password_length_tag='Password must be longer than 8 characters';

  String? emailValidator(String? value) {
    if(value!=null){
      String pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regex =  RegExp(pattern);
      if (!regex.hasMatch(value)) {
        return 'Please enter valid email';
      } else {
        return null;
      }
    }

    else{
      return 'Email is empty';
    }
  }

  String? nameValidator(String value){

    String value1=value.trimRight();
    if(value.isNotEmpty){
      String pattern=r'[!@#<>?":_`~;[\]\\|=+)(*&^%\s-.,/%]$';



      RegExp regex= RegExp(pattern);
      if(value1.isEmpty){
        return field_tag;
      }
      else{
        if(regex.hasMatch(value1)){
          return special_tag;
        }
        else{
          return null;
        }
      }


    }
    else{
      return field_tag;
    }

  }

  String? phoneValidator(String value){
    String new_value;
    //Pattern pattern=r'^[0-9]+$';
    String pattern=r'^[0-9]+$';

    if(( value.startsWith("07")) && value.length==10){
      new_value=value.substring(2,10);

    }

    else if((value.startsWith("+")) && value.length==13){
      new_value=value.substring(4,13);
    }

    else{
      return 'Please enter a valid phone number';
    }

    RegExp regExp= RegExp(pattern);
    if(value.length==0){
      return 'Mobile number is empty';
    }
    else if(!regExp.hasMatch(new_value)){
      return 'please enter valid mobile number';
    }

    return null;

  }



  String concatenateNumber(String code,String number){

    if(number.startsWith("0")){
      String new_value=number.substring(1,number.length);
      String new_value1=code+new_value;
      return new_value1;
    }

    else{
      String new_value=code + number;
      return new_value;
    }



  }

}