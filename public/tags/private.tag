<private>
    <div class="login" if={currentUser}>
      <p>Welcome to the admin section, {currentUser.email}</p>
      <button type="button" onclick={ logOut}>Log Out</button>
    </div>

    <div class="memeMaker">
      <input type="text" ref="urlEl" placeholder="Enter url">
      <input type="text" ref="captionEl" placeholder="Enter caption">
      <input type="text" ref="funnyEl" placeholder="Enter funness (0 to 5)">
      <button type="button" onclick={ saveMeme }>Add Meme</button>
    </div>

    <div class="order">
      <p>order data by</p>
      <select ref="order" value="" onchange={ orderResults }>
        <option value="default">default</option>
        <option value="funnees">funnees</option>
        <option value="caption">caption</option>
      </select>
    </div>

    <div class="filter">
      <p>filter by level of fun</p>
      <select ref="fun" value="" onchange={ filterResults }>
        <option value="default">Default</option>
        <option value="nofun">No Fun</option>
        <option value="somewhatfun">Some Fun</option>
        <option value="veryfun">Very Fun</option>
      </select>
    </div>

    <div show={ myMemes.length == 0 }>
      <p>NO MEMEs. Add a meme from above.</p>
    </div>

    <admin_entry each={ myMemes }></admin_entry>


<script>
  var tag= this;
  // console.log("parent " ,this.parent.currentUser);

  this.currentUser = firebase.auth().currentUser;

  this.logOut = this.parent.logOut;

  // var messagesRef = rootRef.child("memes");
  var myRef = rootRef.child('memes/private/' + this.currentUser.uid);

  //local database is always empty, and read dynamicly from fb.
  this.myMemes = [];

  //prepare to push into memes subdirectory in our database
  this.saveMeme = function () {
    let key = myRef.push().key;
    let meme = {
      id: key,
      userID: this.currentUser.uid, //global google authenticated user object
      public: false,
      url: this.refs.urlEl.value,
      caption: this.refs.captionEl.value,
      funness: this.refs.funnyEl.value
    }

    //messagesRef.child(key).set(meme);
    //set meme while catching potential error messages(optional)
    myRef.child(key).set(meme).then(function (result) {
      console.log(result);
    }).catch(function (error) {
      console.log(error.message);
    });

    this.reset();
  }

  this.reset = function () {
    //clean up default input values
    this.refs.urlEl.value = "";
    this.refs.captionEl.value = "";
    this.refs.funnyEl.value = "";
  }

  // listen to database value change and update result
  myRef.on('value', function (snap) {
    let rawdata = snap.val();
    // console.log("rawdata", rawdata);
    let tempData = [];
    for (key in rawdata) {
      tempData.push(rawdata[key]);
    }
    // console.log("myMemes", tag.myMemes);
    tag.myMemes = tempData;
    tag.update();
  })

</script>

<style></style> -->


</private>
