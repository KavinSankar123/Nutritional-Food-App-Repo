<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication3.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>JavaScript - read JSON from URL</title>
    <style>
        body {
        }
        #text1 {
            position: fixed;
            color: pink;
            font-size: 24px;
            font-weight: bold;
            right: 370px;
            top: 330px;
            text-align: right;
            font-size:35px;
            
            z-index: 50;
        }
        .mypanel{
            position: fixed;
            color: White;
            font-size: 24px;
            font-weight: bold;
            right: 465px;
            top: 380px;
            text-align: right;
            font-size:35px;
            text-align:left;
            z-index: 50;
        }
        label.search-query {
            position: fixed;
            color: pink;
            font-size: 28px;
            font-weight: bold;
            right: 570px;
            top: 300px;
            text-align: right;
            font-size:35px;
            
            z-index: 50;
            background-color: #ffd800;
            color: black;
        }
        select.style{
            position: fixed;
            color: pink;
            font-size: 28px;
            font-weight: bold;
            right: 410px;
            top: 300px;
            text-align: right;
            font-size:35px;
            
            z-index: 50;
            background-color: #ffd800;
            color: black;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

     <script>
/*
         let dropdown = $('#food');

         dropdown.empty();

         dropdown.append('<option selected="true" disabled>Choose food</option>');
         dropdown.prop('selectedIndex', 0);

         const url = 'https://api.myjson.com/bins/7xq2x';

         // Populate dropdown with list of provinces
         $.getJSON(url, function (data) {
             $.each(data, function (key, entry) {
                 dropdown.append($('<option></option>').attr('value', entry.abbreviation).text(entry.name));
             })
         });
         */
         function nutrients()
         {
             $(".mypanel").html("");
             var id = document.getElementById("food").value;
             var url = 'https://api.nal.usda.gov/fdc/v1/food/' + id + '?api_key=k7A6MmWxYCp0DzLN6YbTj9h89WZk3fgS8W1KijXU';

             //   var url = 'https://api.nal.usda.gov/fdc/v1/food/1648210?api_key=k7A6MmWxYCp0DzLN6YbTj9h89WZk3fgS8W1KijXU';
             $.getJSON(url, function (data) {

                 const myJSON = data.labelNutrients;
                 var text = `${data.description} <br> Fats: ${myJSON.fat.value} <br>sodium: ${myJSON.sodium.value}<br>carbohydrates: ${myJSON.carbohydrates.value} 
                        <br> sugars: ${myJSON.sugars.value} <br> protein: ${myJSON.protein.value} <br> calories : ${myJSON.calories.value}`


                 $(".mypanel").html(text);

             });
         }




     </script>
</head>

<body>
    <div class="mypanel"></div>
     <div class="carousel-inner">
        <div class="carousel-item active">           
                <label class ="search-query" for="Food">Choose a Food:</label>

                <select  id="food" class ="style"  onchange="nutrients()">  <!--Call run() function-->
                   <option value="null">select</option>
                   <option value="1648210">apple</option>
                   <option value="1648210" ">apple1</option>
                   <option value="1648210">banana</option>-- 
                  
                </select>
            
                <img class="d-block w-100 work" src="nutrition.jpeg" style="filter: brightness(50%);height: 740px;width:1500px;z-index:-99 "/>
       </div>
        

    </div>
        
       

   

</body>
</html>
