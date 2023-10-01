   function per()
            {
             alert('اجازه دسترسی به این قسمت برای شما داده نشده است'); return false;
            }

   
   function Logout(id)
            {
                if(confirm("آیا مطمئن هستید که می خواهید از سامانه خارج شوید ؟"))
                {
                document.getElementById("LogoutID").value=id;
                document.getElementById("FrmLogout").submit();
                return true;
            }
            else{return false;}
            }
   function run(id)
            {
                document.getElementById("SERVICEID").value=id;
                document.getElementById("Start").value = 0;
                document.getElementById("End").value = 20;
                return true;
            }
            function runarch(id)
            {
               if(document.getElementById('rs').value > 300)
                    {
                        alert("تعداد رکورد نمی تواند بیشتر از 300 باشد ");
                        return false;
                    }
                document.getElementById("SERVICEID").value=id;
                document.getElementById("Start").value = 0;
                document.getElementById("End").value = 20;
                return true;
            }
            function runPass(id)
            {
               if(document.getElementById('p').value != document.getElementById('p2').value)
                    {
                        alert("تکرار رمز با رمز مطابقت ندارد");
                        return false;
                    }
                    if(document.getElementById('p').value == "" ||  document.getElementById('p2').value=="")
                    {
                        alert("رمز نباید خالی باشد");
                        return false;
                    }
                document.getElementById("SERVICEID").value=id;
                return true;
            }
            function runPic(id)
            {

                document.getElementById("SERVICEID").value=id;
                return true;
            }
            function run2(id)
            {
                document.getElementById("SERVICEID").value=id;
                return true;
            }
            function runu(id)
            {
                if(document.getElementById("Space").value < document.getElementById("spc").value){
                    alert("فضا اختصاص داده شده به کاربر نباید بیشتر از " + document.getElementById("spc").value + " مگابایت باشد" );
                    return false;
                }
                document.getElementById("SERVICEID").value=id;
                document.getElementById("Start").value = 0;
                document.getElementById("End").value = 20;
                return true;
            }
   function hied()
   {
      // document.getElementById("sp").style.visibility="hidden";
      var c=document.getElementById("sp");
       c.parentNode.removeChild(c);
       return false;
   }
   function f1()
   {
       var cc=document.getElementById("th1");
       cc.parentNode.removeChild(cc);
       for (var i = 0, max = 100; i < max; i++) {
          var c=document.getElementById("t1" + i);
          c.parentNode.removeChild(c); 
    }
       return false;
   }
   
      function f2()
   {
       var cc=document.getElementById("th2");
       cc.parentNode.removeChild(cc);
       for (var i = 0, max = 100; i < max; i++) {
          var c=document.getElementById("t2" + i);
          c.parentNode.removeChild(c); 
    }
       return false;
   }
   
      function f3()
   {
       var cc=document.getElementById("th3");
       cc.parentNode.removeChild(cc);
       for (var i = 0, max = 100; i < max; i++) {
          var c=document.getElementById("t3" + i);
          c.parentNode.removeChild(c); 
    }
       return false;
   }
         function f4()
   {
       var cc=document.getElementById("th4");
       cc.parentNode.removeChild(cc);
       for (var i = 0, max = 100; i < max; i++) {
          var c=document.getElementById("t4" + i);
          c.parentNode.removeChild(c); 
    }
       return false;
   }
         function f5()
   {
       var cc=document.getElementById("th5");
       cc.parentNode.removeChild(cc);
       for (var i = 0, max = 100; i < max; i++) {
          var c=document.getElementById("t5" + i);
          c.parentNode.removeChild(c); 
    }
       return false;
   }
         function f6()
   {
       var cc=document.getElementById("th6");
       cc.parentNode.removeChild(cc);
       for (var i = 0, max = 100; i < max; i++) {
          var c=document.getElementById("t6" + i);
          c.parentNode.removeChild(c); 
    }
       return false;
   }
         function f7()
   {
       var cc=document.getElementById("th7");
       cc.parentNode.removeChild(cc);
       for (var i = 0, max = 100; i < max; i++) {
          var c=document.getElementById("t7" + i);
          c.parentNode.removeChild(c); 
    }
       return false;
   }
         function f8()
   {
       var cc=document.getElementById("th8");
       cc.parentNode.removeChild(cc);
       for (var i = 0, max = 100; i < max; i++) {
          var c=document.getElementById("t8" + i);
          c.parentNode.removeChild(c); 
    }
       return false;
   }
            function f9()
   {
       var cc=document.getElementById("th9");
       cc.parentNode.removeChild(cc);
       for (var i = 0, max = 100; i < max; i++) {
          var c=document.getElementById("t9" + i);
          c.parentNode.removeChild(c); 
    }
       return false;
   }
            function f10()
   {
       var cc=document.getElementById("th10");
       cc.parentNode.removeChild(cc);
       for (var i = 0, max = 100; i < max; i++) {
          var c=document.getElementById("t10" + i);
          c.parentNode.removeChild(c); 
    }
       return false;
   }
   function NextPage()
   {
       var s=document.getElementById("Start").value;
       var e=document.getElementById("End").value;
       document.getElementById("Start").value =   parseInt(s) + 20;
       document.getElementById("End").value = parseInt(e) + 20;
       if(document.getElementById("SERVICEID").value != 3)
       {
          document.getElementById("SERVICEID").value = 2; 
           
       }
       return true;
   }
   
   function ReturnPage()
   {
       document.getElementById("Start").value=document.getElementById("Start").value - 20;
       document.getElementById("End").value=document.getElementById("End").value - 20;
       if(document.getElementById("SERVICEID").value != 3)
       {
          document.getElementById("SERVICEID").value = 2; 
           
       }
       return true;
   }
   
   function Submit(id)
   {
       document.getElementById(id).submit();
       return true;
   }
   function Submit2(id)
   {
       document.getElementById("SERVICEID").value = 2;
       document.getElementById(id).submit();
       return true;
   }
   
   
   
var Uname;
var id;
var Pos;
function tableRow(id) {

    var tbl = document.getElementById(id);
    // var a1 = document.getElementById("a1").onclick;
    if (tbl != null) {
        for (var i = 0; i < tbl.rows.length; i++) {
            if(i!=0)
            {
            tbl.rows[i].onclick = function () { getval4(this); };
            for (var j = 0; j < tbl.rows[i].cells.length; j++) {
                tbl.rows[i].cells[j].onclick = function () { getval1(this); };

            }
        }

        }
    }
}

function getval1(cel) {

    id = $(cel).attr('id');
    Pos=cel.innerHTML;
}

function getval4(row) {


    if (id == 2) {
        if(confirm("آیا مطمعن هستید که می خواهید سازمان انتخابی را تغییر وضعیت دهید؟")){
        Uname = row.cells[1].innerHTML;
        document.getElementById("SERVICEID").value = 4;
        document.getElementById("OCode").value = Uname;
        document.getElementById("Pos").value = Pos;
        document.getElementById("f4").submit();
    }

    }
    else if (id == 3) {
        
            Uname = row.cells[1].innerHTML;
            document.getElementById("SERVICEID").value = 5;
            document.getElementById("OCode").value = Uname;
            document.getElementById("f4").submit();
            return true;
        
    }
    else if (id == 10) {
         if(confirm("آیا مطمعن هستید که می خواهید متن انتخابی راحذف کنید؟")){
            Uname = row.cells[1].innerHTML;
            document.getElementById("SERVICEID").value = 2;
            document.getElementById("TxtDrp").value = Uname;
            document.getElementById("frm6").submit();
            return true;
        }
        
    }
    else { return false; }




}

function tableRow2(id) {

    var tbl = document.getElementById(id);
    // var a1 = document.getElementById("a1").onclick;
    if (tbl != null) {
        for (var i = 0; i < tbl.rows.length; i++) {
            if(i!=0)
            {
            tbl.rows[i].onclick = function () { getval5(this); };
            for (var j = 0; j < tbl.rows[i].cells.length; j++) {
                tbl.rows[i].cells[j].onclick = function () { getval2(this); };

            }
        }

        }
    }
}

function getval2(cel) {

    id = $(cel).attr('id');
    Pos=cel.innerHTML;
}

function getval5(row) {


    if (id == 2) {
        if(confirm("آیا مطمعن هستید که می خواهید کاربر انتخابی را تغییر وضعیت دهید؟")){
        Uname = row.cells[1].innerHTML;
        document.getElementById("SERVICEID").value = 4;
        document.getElementById("UCode").value = Uname;
        document.getElementById("Pos").value = Pos;
        document.getElementById("f5").submit();
    }

    }
    else if (id == 3) {
        
            Uname = row.cells[1].innerHTML;
            Uname3 = row.cells[2].innerHTML;
            Uname2 = row.cells[3].innerHTML;
            document.getElementById("SERVICEID").value = 5;
            document.getElementById("UCode").value = Uname;
            document.getElementById("UName").value = Uname2;
            document.getElementById("UName2").value = Uname3;
            document.getElementById("f5").submit();
            return true;
        
    }
    else if (id == 4) {
        
            Uname = row.cells[1].innerHTML;
            document.getElementById("SERVICEID").value = 6;
            document.getElementById("UCode").value = Uname;
            document.getElementById("f5").submit();
            return true;
        
    }
    else if (id == 5) {
        
            Uname = row.cells[1].innerHTML;
            document.getElementById("SERVICEID").value = 7;
            document.getElementById("UCode").value = Uname;
            document.getElementById("f5").submit();
            return true;
        
    }
    else { return false; }

 


}






