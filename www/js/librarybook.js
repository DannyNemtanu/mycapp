$$(document).on('click', '.book-content', function searchLink() {
  alert("The book reserved");
  var id = this.id;
  console.log("The Id is: "+id);
  $.ajax({
    url: 'http://localhost:3002/api/libraries'
  }).then(function (data) {
    $('#myBooks .content-block').append(
      '<table>'+
       '<tr>'+
         '<td><img src="img/Science.jpg" style="width:80px;height:100px;"></td>'+
         '<td>'+
           '<table>'+
           '<tr><td>Book ID:'+data[id].bookID+'</td></tr>'+
           '<tr><td>title: '+data[id].title+'</td></tr>'+
           '<tr><td>author: '+data[id].author+'</td></tr>'+
          '</table>'+
         '</td>'+
       '</tr>'+
       '<tr>'+
         '<td>'+
           '<button id="myBtn" onclick="myFunction1()">Renew</button>'+
         '</td>'+
       '</tr>'+
      '</table>'
    );
    });
});

function myFunction() {
    alert("The book reserved");
    var id = this.id;
    console.log("The Id is: "+id);
    $.ajax({
      url: 'http://localhost:3002/api/libraries'
    }).then(function (data) {
      $('#myBooks .content-block').append(
        '<table>'+
         '<tr>'+
           '<td><img src="img/Science.jpg" style="width:80px;height:100px;"></td>'+
           '<td>'+
             '<table>'+
             '<tr><td>bookID:539853072</td></tr>'+
             '<tr><td>title: nibh in quis</td></tr>'+
             '<tr><td>author: Jimmy Lawson</td></tr>'+
            '</table>'+
           '</td>'+
         '</tr>'+
         '<tr>'+
           '<td>'+
             '<button id="myBtn" onclick="myFunction1()">Renew</button>'+
           '</td>'+
         '</tr>'+
        '</table>'
      );
      });
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
         '<div class="book-content" id="'+i+'">'+
           '<div id="bookitem">'+
             '<div id="book-img"><img id="social" src='+'"../img/social.jpg"'+'></img></div>'+
             '<div id="bookdesc">'+
               '<h1>'+(data[i].title).toUpperCase()+'</h1>'+
               '<p>'+data[i].description+'</p>'+
             '</div>'+
           '</div>'+
           '<button type="button" id="myBtn" name="button">Reserve Book</button>'+
         '</div>'
       );
     }
   }
 });


//   //second line

   $.ajax({
      url: 'http://localhost:3002/api/libraries'
    }).then(function (data) {
      // console.log(data);
      for(let i=0;i<data.length;i++){
        if(data[i].category==="Arts and recreation"){
         $('.content-block #arts-and-recreation-category').append(
           '<div class="book-content" id="'+i+'">'+
             '<div id="bookitem">'+
               '<div id="book-img"><img src="../img/art.jpg"></img></div>'+
               '<div id="bookdesc">'+
                 '<h1>'+(data[i].title).toUpperCase()+'</h1>'+
                 '<p>'+data[i].description+'</p>'+
               '</div>'+
             '</div>'+
             '<button type="button" id="myBtn" name="button">Reserve Book</button>'+
           '</div>'
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
           '<div class="book-content" id="'+i+'">'+
             '<div id="bookitem">'+
               '<div id="book-img"><img src="../img/Religion.jpg"></img></div>'+
               '<div id="bookdesc">'+
                 '<h1>'+(data[i].title).toUpperCase()+'</h1>'+
                 '<p>'+data[i].description+'</p>'+
               '</div>'+
             '</div>'+
             '<button type="button" id="myBtn" name="button">Reserve Book</button>'+
           '</div>'
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
           '<div class="book-content" id="'+i+'">'+
             '<div id="bookitem">'+
               '<div id="book-img"><img src="../img/Literature.jpg"></img></div>'+
               '<div id="bookdesc">'+
                 '<h1>'+(data[i].title).toUpperCase()+'</h1>'+
                 '<p>'+data[i].description+'</p>'+
               '</div>'+
             '</div>'+
             '<button type="button" id="myBtn" name="button">Reserve Book</button>'+
           '</div>'
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
           '<div class="book-content" id="'+i+'">'+
             '<div id="bookitem">'+
               '<div id="book-img"><img src="../img/Science.jpg"></img></div>'+
               '<div id="bookdesc">'+
                 '<h1>'+(data[i].title).toUpperCase()+'</h1>'+
                 '<p>'+data[i].description+'</p>'+
               '</div>'+
             '</div>'+
             '<button type="button" id="myBtn" name="button">Reserve Book</button>'+
           '</div>'
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
           '<div class="book-content" id="'+i+'">'+
             '<div id="bookitem">'+
               '<div id="book-img"><img src="../img/information.jpeg"></img></div>'+
               '<div id="bookdesc">'+
                 '<h1>'+(data[i].title).toUpperCase()+'</h1>'+
                 '<p>'+data[i].description+'</p>'+
               '</div>'+
             '</div>'+
             '<button type="button" id="myBtn" name="button">Reserve Book</button>'+
           '</div>'
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
           '<div class="book-content" id="'+i+'">'+
             '<div id="bookitem">'+
               '<div id="book-img"><img src="../img/appliedscience.png"></img></div>'+
               '<div id="bookdesc">'+
                 '<h1>'+(data[i].title).toUpperCase()+'</h1>'+
                 '<p>'+data[i].description+'</p>'+
               '</div>'+
             '</div>'+
             '<button type="button" id="myBtn" name="button">Reserve Book</button>'+
           '</div>'
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
           '<div class="book-content" id="'+i+'">'+
             '<div id="bookitem">'+
               '<div id="book-img"><img src="../img/philosophy.jpg"></img></div>'+
               '<div id="bookdesc">'+
                 '<h1>'+(data[i].title).toUpperCase()+'</h1>'+
                 '<p>'+data[i].description+'</p>'+
               '</div>'+
             '</div>'+
             '<button type="button" id="myBtn" name="button">Reserve Book</button>'+
           '</div>'
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
           '<div class="book-content" id="'+i+'">'+
             '<div id="bookitem">'+
               '<div id="book-img"><img src="../img/computer.jpg"></img></div>'+
               '<div id="bookdesc">'+
                 '<h1>'+(data[i].title).toUpperCase()+'</h1>'+
                 '<p>'+data[i].description+'</p>'+
               '</div>'+
             '</div>'+
             '<button type="button" id="myBtn" name="button">Reserve Book</button>'+
           '</div>'
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
           '<div class="book-content" id="'+i+'">'+
             '<div id="bookitem">'+
               '<div id="book-img"><img src="../img/Language.jpg"></img></div>'+
               '<div id="bookdesc">'+
                 '<h1>'+(data[i].title).toUpperCase()+'</h1>'+
                 '<p>'+data[i].description+'</p>'+
               '</div>'+
             '</div>'+
             '<button type="button" id="myBtn" name="button">Reserve Book</button>'+
           '</div>'
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
           '<div class="book-content" id="'+i+'">'+
             '<div id="bookitem">'+
               '<div id="book-img"><img src="../img/History.jpg"></img></div>'+
               '<div id="bookdesc">'+
                 '<h1>'+(data[i].title).toUpperCase()+'</h1>'+
                 '<p>'+data[i].description+'</p>'+
               '</div>'+
             '</div>'+
             '<button type="button" id="myBtn" name="button">Reserve Book</button>'+
           '</div>'
         );

        }
      }
    });
//
}
