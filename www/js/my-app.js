// Code for platform detection
var isMaterial = Framework7.prototype.device.ios === false;
var isIos = Framework7.prototype.device.ios === true;

// Add the above as global variables for templates
Template7.global = {
  material: isMaterial,
  ios: isIos,
};

// A template helper to turn ms durations to mm:ss
// We need to be able to pad to 2 digits
function pad2(number) {
  if (number <= 99) { number = ('0' + number).slice(-2); }
  return number;
}

// Now the actual helper to turn ms to [hh:]mm:ss
function durationFromMsHelper(ms) {
  if (typeof ms != 'number') {
    return '';
  }
  var x = ms / 1000;
  var seconds = pad2(Math.floor(x % 60));
  x /= 60;
  var minutes = pad2(Math.floor(x % 60));
  x /= 60;
  var hours = Math.floor(x % 24);
  hours = hours ? pad2(hours) + ':' : '';
  return hours + minutes + ':' + seconds;
}

// A stringify helper
// Need to replace any double quotes in the data with the HTML char
//  as it is being placed in the HTML attribute data-context
function stringifyHelper(context) {
  var str = JSON.stringify(context);
  return str.replace(/"/g, '&quot;');
}

// Finally, register the helpers with Template7
Template7.registerHelper('durationFromMs', durationFromMsHelper);
Template7.registerHelper('stringify', stringifyHelper);

// If we need to use custom DOM library, let's save it to $$ variable:
var $$ = Dom7;

if (!isIos) {
  // Change class
  $$('.view.navbar-through').removeClass('navbar-through').addClass('navbar-fixed');
  // And move Navbar into Page
  $$('.view .navbar').prependTo('.view .page');
}

// Initialize app
var myApp = new Framework7({
  material: isIos ? false : true,
  template7Pages: true,
  precompileTemplates: true,
  swipePanel: 'left',
  swipePanelActiveArea: '30',
  swipeBackPage: true,
  animateNavBackIcon: true,
  pushState: !!Framework7.prototype.device.os,
});

// Add view
var mainView = myApp.addView('.view-main', {
  // Because we want to use dynamic navbar, we need to enable it for this view:
  dynamicNavbar: true,
  domCache: true,
});

// Handle Cordova Device Ready Event
$$(document).on('deviceready', function deviceIsReady() {
  console.log('Device is ready!');
  // News Page
  console.log("News Page Ready");
  var mySwiper = new Swiper('.swiper-container', {
    // Optional parameters
    direction: 'vertical',
    loop: true
  });
  $.ajax({
    url: 'http://localhost:3002/api/news?filter={"where":{"collegeID":1}}'
  }).then(function (data) {
    $('.news-events .event-items').empty();
    for (var i = 0; i < data.length; i++) {
      $('.news-events .event-items').append(
        '<a id="' + i + '" class="single-news" href="single-news.html">' +
        '<div class="eitem eitem-' + i + '">' +
        '<div class="eitem-img">' +
        '<div id="eitem-img-top">' + data[i].month + '</div>' +
        '<div id="eitem-img-bottom">' + data[i].date + '</div>' +
        '</div>' +
        '<div class="eitem-desc">' +
        '<h3 id="title">' + (data[i].title).toUpperCase() + '</h3>' +
        '<p id="description">' + data[i].description + '</p>' +
        '<h4 id="date">' + data[i].date + ' ' + data[i].month + ' | ' + data[i].startTime + ':00 - ' + data[i].endTime + ':00 </h4>' +
        '</div>' +
        '</div>' +
        '</a>'
      );
    }
  });
});

// Link To Single News Page
$$(document).on('click', '.single-news', function searchLink() {
  console.log("clicked" + this.id);
  var id = this.id;
  console.log(id);
  $.ajax({
    url: 'http://localhost:3002/api/news?filter={"where":{"collegeID":1}}'
  }).then(function (data) {
    console.log(data[id].title);
    $('.singlepage-news').empty();
    $('.single-page-sliding').append((data[id].title).toUpperCase());
    $('.singlepage-news').append(
      '<div class="single-header"><img src="http://loremflickr.com/320/240?random=' + id + '" alt=""></div>' +
      '<h1 id="title">' + (data[id].title).toUpperCase() + '</h1>' +
      '<p id="description">' + data[id].description + '</p>' +
      '<div class="loc-time">' +
      '<div class="location">' + data[id].location + '</div>' +
      '<div class="time">' + data[id].startTime + ':00 - ' + data[id].endTime + ':00 </div>' +
      '</div>'
    );
  });
});

// Ticket Reserved
$$(document).on('click', '.single-page #reserve', function searchLink() {
  alert("Ticket Reseverd");
});

$$(document).on('click', '.panel .news-link', function searchLink() {
  // Only change route if not already on the index
  //  It would be nice to have a better way of knowing this...
  var indexPage = $$('.page[data-page=index]');
  if (indexPage.hasClass('cached')) {
    mainView.router.load({
      pageName: 'index',
      animatePages: false,
      reload: true,
    });
  }
  // News Page
  console.log("News Page Ready");
  var mySwiper = new Swiper('.swiper-container', {
    // Optional parameters
    direction: 'vertical',
    loop: true
  });
  $.ajax({
    url: 'http://localhost:3002/api/news?filter={"where":{"collegeID":1}}'
  }).then(function (data) {
    $('.news-events .event-items').empty();
    for (var i = 0; i < data.length; i++) {
      $('.news-events .event-items').append(
        '<a id="' + i + '" class="single-news" href="single-news.html">' +
        '<div class="eitem eitem-' + i + '">' +
        '<div class="eitem-img">' +
        '<div id="eitem-img-top">' + data[i].month + '</div>' +
        '<div id="eitem-img-bottom">' + data[i].date + '</div>' +
        '</div>' +
        '<div class="eitem-desc">' +
        '<h3 id="title">' + (data[i].title).toUpperCase() + '</h3>' +
        '<p id="description">' + data[i].description + '</p>' +
        '<h4 id="date">' + data[i].date + ' ' + data[i].month + ' | ' + data[i].startTime + ':00 - ' + data[i].endTime + ':00 </h4>' +
        '</div>' +
        '</div>' +
        '</a>'
      );
    }
  });
});

$$(document).on('click', '.panel .timetable-link', function searchLink() {
  // @TODO fetch the favorites (if any) from localStorage
  var timetablePage = $$('.page[data-page=timetable]');
  if (timetablePage.hasClass('cached')) {
    mainView.router.load({
      pageName: 'timetable',
      animatePages: false,
      reload: true,
    });
  }

  $(document).on('change', 'select', function openTimeTable() {
    $('#timetable-container').empty();
    var code = $(this).val();


    if (code === '9') {
      var monday='';
      var tuesday="";
      var wednesday="";
      var thursday = "";
      $.ajax({
        url: 'http://localhost:3002/api/timetables?filter={"where":{"courseCode":9}}'
      }).then(function (data) {
        for (let i = 0; i < data.length; i++) {
          if (data[i].she_Day === 'Monday') {
            monday+='<li class="event" data-date="'+data[i].timeStart.substring(11,16)+'-'+data[i].timeEnd.substring(11,16)+'">'
                    +'<h3>'+data[i].she_Day+'</h3>'
                    +'<p>'+data[i].className+'</p></li>'       
          } else if (data[i].she_Day === 'Tuesday') {
            tuesday+='<li class="event" data-date="'+data[i].timeStart.substring(11,16)+'-'+data[i].timeEnd.substring(11,16)+'">'
                    +'<h3>'+data[i].she_Day+'</h3>'
                    +'<p>'+data[i].className+'</p></li>'
          } else if (data[i].she_Day === 'Wednesday') {
            wednesday+='<li class="event" data-date="'+data[i].timeStart.substring(11,16)+'-'+data[i].timeEnd.substring(11,16)+'">'
                    +'<h3>'+data[i].she_Day+'</h3>'
                    +'<p>'+data[i].className+'</p></li>'
          } else if (data[i].she_Day === 'Thursday') {
            thursday+='<li class="event" data-date="'+data[i].timeStart.substring(11,16)+'-'+data[i].timeEnd.substring(11,16)+'">'
                    +'<h3>'+data[i].she_Day+'</h3>'
                    +'<p>'+data[i].className+'</p></li>'
          }
        }
             $('#timetable-container').append('<ul class="timeline">'+monday+tuesday+wednesday+thursday+'</ul>');
      });
      
 

    } else if (code === '31') {

      var monday='';
      var tuesday="";
      var wednesday="";
      var thursday = "";
      $.ajax({
        url: 'http://localhost:3002/api/timetables?filter={"where":{"courseCode":31}}'
      }).then(function (data) {
        for (let i = 0; i < data.length; i++) {
          if (data[i].she_Day === 'Monday') {
            monday+='<li class="event" data-date="'+data[i].timeStart.substring(11,16)+'-'+data[i].timeEnd.substring(11,16)+'">'
                    +'<h3>'+data[i].she_Day+'</h3>'
                    +'<p>'+data[i].className+'</p></li>'       
          } else if (data[i].she_Day === 'Tuesday') {
            tuesday+='<li class="event" data-date="'+data[i].timeStart.substring(11,16)+'-'+data[i].timeEnd.substring(11,16)+'">'
                    +'<h3>'+data[i].she_Day+'</h3>'
                    +'<p>'+data[i].className+'</p></li>'
          } else if (data[i].she_Day === 'Wednesday') {
            wednesday+='<li class="event" data-date="'+data[i].timeStart.substring(11,16)+'-'+data[i].timeEnd.substring(11,16)+'">'
                    +'<h3>'+data[i].she_Day+'</h3>'
                    +'<p>'+data[i].className+'</p></li>'
          } else if (data[i].she_Day === 'Thursday') {
            thursday+='<li class="event" data-date="'+data[i].timeStart.substring(11,16)+'-'+data[i].timeEnd.substring(11,16)+'">'
                    +'<h3>'+data[i].she_Day+'</h3>'
                    +'<p>'+data[i].className+'</p></li>'
          }
        }
             $('#timetable-container').append('<ul class="timeline">'+monday+tuesday+wednesday+thursday+'</ul>');
      });

    }


  });

});






$$(document).on('click', '.panel .grades-link', function searchLink() {
  // @TODO fetch the favorites (if any) from localStorage
  var gradesPage = $$('.page[data-page=grades]');
  if (gradesPage.hasClass('cached')) {
    mainView.router.load({
      pageName: 'grades',
      animatePages: false,
      reload: true,
    });
  }
  console.log("Grades Page Ready!");
  $.ajax({
    url: 'http://localhost:3002/api/grades?filter={"where":{"studentNumber": "x15534742"}}'
  }).then(function (data) {
    $('.grades-page .grades-list').empty();
    for (var i = 0; i < data.length; i++) {
      var check = data[i].grade;
      if (check > 40) {
        var pass = "Pass";
        var credit = 5;
      } else {
        var pass = "Fail";
        var credit = 0;
      }
      $('.grades-page .grades-list').append(
        '<li>' +
        '<h3>' + data[i].ClassName + '</h3>' +
        '<p id="grade"> Credit:' + credit + ' - Result:' + data[i].grade + ' - Grade:' + pass + '</p>' +
        '</li>'
      );
    }
  });
});

$$(document).on('click', '.panel .library-link', function searchLink() {
  var libraryPage = $$('.page[data-page=library]');
  if (libraryPage.hasClass('cached')) {
    mainView.router.load({
      pageName: 'library',
      animatePages: false,
      reload: true,
    });
  }
});

$$(document).on('click', '.panel .support-link', function searchLink() {
  // @TODO fetch the favorites (if any) from localStorage
  var supportPage = $$('.page[data-page=support]');
  if (supportPage.hasClass('cached')) {
    mainView.router.load({
      pageName: 'support',
      animatePages: false,
      reload: true,
    });
  }

  console.log("Hello");
  $.ajax({
    url: 'http://localhost:3002/api/supports?filter={"where":{"collegeID":1}}'
  }).then(function (data) {
    $('.content-block #container1').empty();
    for (var i = 0; i < data.length; i++) {
      $('.content-block #container1').append(
        '<div id="support-block' + i + '">' +
        '<a href="#" class="support-selection button button5">'
        + data[i].supportName +
        '</a>' +
        '<div class="support-info">' +
        '<h3>Support Type:' + data[i].desc + '</h3>' +
        '<h3>Contact Number:' + data[i].contactNum + '</h3>' +
        '<h3>Location:' + data[i].location + '</h3>' +
        '</div>' +
        '</div>');
    }
  });
});



/**
 * Search
 *  - functionality for the main search page
 */

function searchSubmit(e) {
  var formData = myApp.formToJSON('#search');
  e.preventDefault();
  if (!formData.q) {
    myApp.alert('Please enter a search term', 'Search Error');
    return;
  }

  if (formData.filter === 'all') {
    formData.q = formData.q.trim();
  } else {
    formData.q = formData.filter + ':' + formData.q.trim();
  }
  delete formData.filter;
  formData.type = 'track';
  $$('input').blur();
  myApp.showPreloader('Searching');
  $$.ajax({
    dataType: 'json',
    data: formData,
    processData: true,
    url: 'https://api.spotify.com/v1/search',
    success: function searchSuccess(resp) {
      resp.tracks.count = resp.tracks.items.length === 25 ? "25 (max)" : resp.tracks.items.length;
      myApp.hidePreloader();
      mainView.router.load({
        template: myApp.templates.results,
        context: {
          tracks: resp.tracks,
        },
      });
    },
    error: function searchError(xhr, err) {
      myApp.hidePreloader();
      myApp.alert('An error has occurred', 'Search Error');
      console.error("Error on ajax call: " + err);
      console.log(JSON.stringify(xhr));
    }
  });
}

$$(document).on('submit', '#search', searchSubmit);

/**
 * Details page
 *  - controls the playback controls and preview media object
 */

var mediaPreview = null;
var mediaTimer = null;

function playbackControlsClickHandler(e) {
  var buttonTarget = $$(e.target);
  if (buttonTarget.hasClass('play')) {
    monitorMediaPreviewCurrentPosition(mediaPreview);
    mediaPreview.play();
    setPlaybackControlsStatus('pending');
    return;
  }
  monitorMediaPreviewCurrentPosition();
  mediaPreview.stop();
  setPlaybackControlsStatus('stopped');
  return;
};

function setPlaybackControlsStatus(status) {
  var allButtons = $$('.playback-controls a');
  var playButton = $$('.playback-controls .play-button');
  var pendingButton = $$('.playback-controls .pending-button');
  var stopButton = $$('.playback-controls .stop-button');
  switch (status) {
    case 'stopped':
      allButtons.removeClass('displayed');
      playButton.addClass('displayed');
      break;
    case 'pending':
      allButtons.removeClass('displayed');
      pendingButton.addClass('displayed');
      break;
    case 'playing':
      allButtons.removeClass('displayed');
      stopButton.addClass('displayed');
      break;
    default:
      allButtons.removeClass('displayed');
      playButton.addClass('displayed');
  }
}

function monitorMediaPreviewCurrentPosition(media) {
  var percent = 0;
  var progressbar = $$('.playback-controls .duration .progressbar');
  // If no media object is provided, stop monitoring
  if (!media) {
    clearInterval(mediaTimer);
    return;
  }
  mediaTimer = setInterval(function () {
    media.getCurrentPosition(
      function (position) {
        if (position > -1) {
          percent = (position / media.getDuration()) * 100;
          myApp.setProgressbar(progressbar, percent);
        }
      },
      function (e) {
        console.error("Error getting position", e);
      });
  }, 100);
}

function mediaPreviewSuccessCallback() {
  var progressbar = $$('.playback-controls .duration .progressbar');
  setPlaybackControlsStatus('stopped');
  myApp.setProgressbar(progressbar, 0, 100);
}

function mediaPreviewErrorCallback(error) {
  setPlaybackControlsStatus('stopped');
  console.error(error);
}

function mediaPreviewStatusCallback(status) {
  var progressbar = $$('.playback-controls .duration .progressbar');
  switch (status) {
    case 2: // playing
      setPlaybackControlsStatus('playing');
      myApp.setProgressbar(progressbar, 0, 0);
      break;
    case 4: // stopped
      setPlaybackControlsStatus('stopped');
      break;
    default:
    // Default fall back not needed
  }
}

function addOrRemoveFavorite(e) {
  if (this.isFavorite) {
    // remove the favorite from the arrays
    this.favoriteIds.splice(this.favoriteIds.indexOf(this.id), 1);
    var favorites = this.favorites.filter(function (fave) {
      return fave.id !== this.id;
    }, this);
    this.favorites = favorites;
    this.isFavorite = false;
    // update the UI
    $$('.link.star').html('<i class="fa fa-star-o"></i>');
  } else {
    // add the favorite to the arrays
    if (this.favorites === null) this.favorites = [];
    this.favorites.push(this.track);
    this.favoriteIds.push(this.id);
    this.isFavorite = true;
    // update the UI
    $$('.link.star').html('<i class="fa fa-star"></i>');
  }
  if (this.favorites.length === 0) {
    // clear it out so the template knows it's empty when it returns
    //  as {{#if favorites}} sees an empty array as truthy
    this.favorites = null;
  }
  // save it back to localStorage
  localStorage.setItem('favorites', JSON.stringify(this.favorites));
  localStorage.setItem('favoriteIds', JSON.stringify(this.favoriteIds));
  // if we got here from the favorites page, we need to reload its context
  //  so it will update as soon as we go "back"
  if (this.fromPage === 'favorites') {
    // Reload the previous page
    mainView.router.load({
      template: myApp.templates.favorites,
      context: {
        tracks: this.favorites,
      },
      reload: true,
      reloadPrevious: true,
    });
  }
}

myApp.onPageInit('details', function (page) {
  var previewUrl = page.context.preview_url;
  if (typeof Media !== 'undefined') {
    // Create media object on page load so as to let it start buffering right
    //  away...
    mediaPreview = new Media(previewUrl, mediaPreviewSuccessCallback,
      mediaPreviewErrorCallback, mediaPreviewStatusCallback);
  } else {
    // Create a dummy media object for when viewing in a browser, etc
    //  this really is optional, using `phonegap serve` polyfills the
    //  Media plugin
    function noMedia() {
      myApp.alert('Media playback not supported', 'Media Error');
      setTimeout(function () {
        setPlaybackControlsStatus('stopped');
        mediaPreviewStatusCallback(4); // stopped
        console.error('No media plugin available');
      }, 0);
    }
    mediaPreview = {
      play: noMedia,
      stop: function () { },
      release: function () { },
      getCurrentPosition: function () { },
    };
  }

  // fetch the favorites
  var favorites = JSON.parse(localStorage.getItem('favorites')) || [];
  var favoriteIds = JSON.parse(localStorage.getItem('favoriteIds')) || [];
  var isFavorite = false;
  if (favoriteIds.indexOf(page.context.id) !== -1) {
    $$('.link.star').html('<i class="fa fa-star"></i>');
    isFavorite = true;
  }
  // set up a context object to pass to the handler
  var pageContext = {
    track: page.context,
    id: page.context.id,
    isFavorite: isFavorite,
    favorites: favorites,
    favoriteIds: favoriteIds,
    fromPage: page.fromPage.name,
  };

  // bind the playback and favorite controls
  $$('.playback-controls a').on('click', playbackControlsClickHandler);
  $$('.link.star').on('click', addOrRemoveFavorite.bind(pageContext));
});

myApp.onPageBeforeRemove('details', function (page) {
  // stop playing before leaving the page
  monitorMediaPreviewCurrentPosition();
  mediaPreview.stop();
  mediaPreview.release();
  // keep from leaking memory by removing the listeners we don't need
  $$('.playback-controls a').off('click', playbackControlsClickHandler);
  $$('.link.star').off('click', addOrRemoveFavorite);
});
