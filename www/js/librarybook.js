function myFunction() {
    alert("The book reserved");
}

function myFunction1() {
    alert("The book renewed");
}

function openCity(evt, cityName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
}
function loadingBook(){
  //first line
    $.ajax({
      url: 'http://localhost:3002/api/libraries'
    }).then(function (data) {
      // console.log(data);
      for(let i=0;i<data.length;i++){
        if(data[i].category==="Social Sciences"){
         $('.content-block #social-science-category').append(
          '<table>'+
          '<div id="book-block' + i + '">' +
            '<tr>'+'<td>'+'<img id="social" src='+"../img/social.jpg"+'></img>'+'</td>'+
            '<td>'+'<h5>Book title : '+data[i].title+'</h5>'+
            '<h5>Book ID : '+data[i].bookID+'</h5>'+
            '<h5>Book author : '+data[i].author+'</h5>'+
            '<h5>Book description : '+data[i].description+'</td>'+'</tr>'+
            '<tr>'+'<td>'+
            '<button id="myBtn" onclick="myFunction()">Reserve</button>'+
            '</td>'+'</tr>'+
          '</div>'+'</table>'
         );

        }
      }
    });

  //second line

   $.ajax({
      url: 'http://localhost:3002/api/libraries'
    }).then(function (data) {
      // console.log(data);
      for(let i=0;i<data.length;i++){
        if(data[i].category==="Arts and recreation"){
         $('.content-block #arts-and-recreation-category').append(
          '<table>'+
          '<div id="book-block' + i + '">' +
            '<tr>'+'<td>'+'<img src='+"../img/art.jpg"+'></img>'+'</td>'+
            '<td>'+'<h5>Book title : '+data[i].title+'</h5>'+
            '<h5>Book ID : '+data[i].bookID+'</h5>'+
            '<h5>Book author : '+data[i].author+'</h5>'+
            '<h5>Book description : '+data[i].description+'</td>'+'</tr>'+
            '<tr>'+'<td>'+
            '<button id="myBtn" onclick="myFunction()">Reserve</button>'+
            '</td>'+'</tr>'+
          '</div>'+'</table>'
         );

        }
      }
    });
    //third line
    $.ajax({
      url: 'http://localhost:3002/api/libraries'
    }).then(function (data) {
      // console.log(data);
      for(let i=0;i<data.length;i++){
        if(data[i].category==="Religion"){
         $('.content-block #religion-category').append(
            '<table>'+
          '<div id="book-block' + i + '">' +
            '<tr>'+'<td>'+'<img src='+"../img/Religion.jpg"+'></img>'+'</td>'+
            '<td>'+'<h5>Book title : '+data[i].title+'</h5>'+
            '<h5>Book ID : '+data[i].bookID+'</h5>'+
            '<h5>Book author : '+data[i].author+'</h5>'+
            '<h5>Book description : '+data[i].description+'</td>'+'</tr>'+
            '<tr>'+'<td>'+
            '<button id="myBtn" onclick="myFunction()">Reserve</button>'+
            '</td>'+'</tr>'+
          '</div>'+'</table>'
         );

        }
      }
    });
    //fourth line
    $.ajax({
      url: 'http://localhost:3002/api/libraries'
    }).then(function (data) {
      // console.log(data);
      for(let i=0;i<data.length;i++){
        if(data[i].category==="Literature"){
         $('.content-block #literature-category').append(
          '<table>'+
          '<div id="book-block' + i + '">' +
            '<tr>'+'<td>'+'<img src='+"../img/Literature.jpg"+'></img>'+'</td>'+
            '<td>'+'<h5>Book title : '+data[i].title+'</h5>'+
            '<h5>Book ID : '+data[i].bookID+'</h5>'+
            '<h5>Book author : '+data[i].author+'</h5>'+
            '<h5>Book description : '+data[i].description+'</td>'+'</tr>'+
            '<tr>'+'<td>'+
            '<button id="myBtn" onclick="myFunction()">Reserve</button>'+
            '</td>'+'</tr>'+
          '</div>'+'</table>'
         );

        }
      }
    });
    //fifth line
    $.ajax({
      url: 'http://localhost:3002/api/libraries'
    }).then(function (data) {
      // console.log(data);
      for(let i=0;i<data.length;i++){
        if(data[i].category==="Science"){
         $('.content-block #science-category').append(
           '<table>'+
          '<div id="book-block' + i + '">' +
            '<tr>'+'<td>'+'<img src='+"../img/Science.jpg"+'></img>'+'</td>'+
            '<td>'+'<h5>Book title : '+data[i].title+'</h5>'+
            '<h5>Book ID : '+data[i].bookID+'</h5>'+
            '<h5>Book author : '+data[i].author+'</h5>'+
            '<h5>Book description : '+data[i].description+'</td>'+'</tr>'+
            '<tr>'+'<td>'+
            '<button id="myBtn" onclick="myFunction()">Reserve</button>'+
            '</td>'+'</tr>'+
          '</div>'+'</table>'
         );

        }
      }
    });


    //6th line
     $.ajax({
      url: 'http://localhost:3002/api/libraries'
    }).then(function (data) {
      // console.log(data);
      for(let i=0;i<data.length;i++){
        if(data[i].category==="information and general works"){
         $('.content-block #information-and-general-works-category').append(
           '<table>'+
          '<div id="book-block' + i + '">' +
            '<tr>'+'<td>'+'<img src='+"../img/information.jpeg"+'></img>'+'</td>'+
            '<td>'+'<h5>Book title : '+data[i].title+'</h5>'+
            '<h5>Book ID : '+data[i].bookID+'</h5>'+
            '<h5>Book author : '+data[i].author+'</h5>'+
            '<h5>Book description : '+data[i].description+'</td>'+'</tr>'+
            '<tr>'+'<td>'+
            '<button id="myBtn" onclick="myFunction()">Reserve</button>'+
            '</td>'+'</tr>'+
          '</div>'+'</table>'
         );

        }
      }
    });
    //7th line
     $.ajax({
      url: 'http://localhost:3002/api/libraries'
    }).then(function (data) {
      // console.log(data);
      for(let i=0;i<data.length;i++){
        if(data[i].category==="Technology and applied science"){
         $('.content-block #technology-and-applied-science-category').append(
           '<table>'+
          '<div id="book-block' + i + '">' +
            '<tr>'+'<td>'+'<img src='+"../img/appliedscience.png"+'></img>'+'</td>'+
            '<td>'+'<h5>Book title : '+data[i].title+'</h5>'+
            '<h5>Book ID : '+data[i].bookID+'</h5>'+
            '<h5>Book author : '+data[i].author+'</h5>'+
            '<h5>Book description : '+data[i].description+'</td>'+'</tr>'+
           '<tr>'+'<td>'+
            '<button id="myBtn" onclick="myFunction()">Reserve</button>'+
            '</td>'+'</tr>'+
          '</div>'+'</table>'
         );

        }
      }
    });

  //8th
       $.ajax({
      url: 'http://localhost:3002/api/libraries'
    }).then(function (data) {
      // console.log(data);
      for(let i=0;i<data.length;i++){
        if(data[i].category==="Philosophy and psychology"){
         $('.content-block #philosophy-and-psychology-category').append(
           '<table>'+
          '<div id="book-block' + i + '">' +
            '<tr>'+'<td>'+'<img src='+"../img/Philosophy.jpg"+'></img>'+'</td>'+
            '<td>'+'<h5>Book title : '+data[i].title+'</h5>'+
            '<h5>Book ID : '+data[i].bookID+'</h5>'+
            '<h5>Book author : '+data[i].author+'</h5>'+
            '<h5>Book description : '+data[i].description+'</td>'+'</tr>'+
           '<tr>'+'<td>'+
            '<button id="myBtn" onclick="myFunction()">Reserve</button>'+
            '</td>'+'</tr>'+
          '</div>'+'</table>'
         );

        }
      }
    });
  //9th
       $.ajax({
      url: 'http://localhost:3002/api/libraries'
    }).then(function (data) {
      // console.log(data);
      for(let i=0;i<data.length;i++){
        if(data[i].category==="Computer science"){
         $('.content-block #computer-science-category').append(
           '<table>'+
          '<div id="book-block' + i + '">' +
            '<tr>'+'<td>'+'<img src='+"../img/computer.jpg"+'></img>'+'</td>'+
            '<td>'+'<h5>Book title : '+data[i].title+'</h5>'+
            '<h5>Book ID : '+data[i].bookID+'</h5>'+
            '<h5>Book author : '+data[i].author+'</h5>'+
            '<h5>Book description : '+data[i].description+'</td>'+'</tr>'+
            '<tr>'+'<td>'+
            '<button id="myBtn" onclick="myFunction()">Reserve</button>'+
            '</td>'+'</tr>'+
          '</div>'+'</table>'
         );

        }
      }
    });
  //10th
       $.ajax({
      url: 'http://localhost:3002/api/libraries'
    }).then(function (data) {
      // console.log(data);
      for(let i=0;i<data.length;i++){
        if(data[i].category==="Language"){
         $('.content-block #language-category').append(
           '<table>'+
          '<div id="book-block' + i + '">' +
            '<tr>'+'<td>'+'<img src='+"../img/Language.jpg"+'></img>'+'</td>'+
            '<td>'+'<h5>Book title : '+data[i].title+'</h5>'+
            '<h5>Book ID : '+data[i].bookID+'</h5>'+
            '<h5>Book author : '+data[i].author+'</h5>'+
            '<h5>Book description : '+data[i].description+'</td>'+'</tr>'+
            '<tr>'+'<td>'+
            '<button id="myBtn" onclick="myFunction()">Reserve</button>'+
            '</td>'+'</tr>'+
          '</div>'+'</table>'
         );

        }
      }
    });

  //11th
     $.ajax({
      url: 'http://localhost:3002/api/libraries'
    }).then(function (data) {
      // console.log(data);
      for(let i=0;i<data.length;i++){
        if(data[i].category==="History and geography"){
         $('.content-block #history-and-geography-category').append(
           '<table>'+
          '<div id="book-block' + i + '">' +
            '<tr>'+'<td>'+'<img src='+"../img/History.jpg"+'></img>'+'</td>'+
            '<td>'+'<h5>Book title : '+data[i].title+'</h5>'+
            '<h5>Book ID : '+data[i].bookID+'</h5>'+
            '<h5>Book author : '+data[i].author+'</h5>'+
            '<h5>Book description : '+data[i].description+'</td>'+'</tr>'+
           '<tr>'+'<td>'+
            '<button id="myBtn" onclick="myFunction()">Reserve</button>'+
            '</td>'+'</tr>'+
          '</div>'+'</table>'
         );

        }
      }
    });

}
