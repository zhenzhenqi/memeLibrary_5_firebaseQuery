<admin>
  <div class="login" if={!currentUser}>
    <p>Thanks for visiting. Please proceed to Google Authentication</p>
    <button type="button" onclick={ logIn }>Login</button>
  </div>

  <div class="login" if={currentUser}>
    <p>Welcome to the admin section, {currentUser.email}</p>
    <button type="button" onclick={ logOut}>Log Out</button>
  </div>

  <private if={currentUser}></private>

  <script>
    var tag = this;
    // Firebase provide us with easy methods to sign-in and sign-out. We can access all Firebase authentication methods by creating an Auth Object via the following:
    // this.currentUser = firebase.auth().currentUser;
  //  this.currentUser;

  //  console.log(this.currentUser);

  this.currentUser = firebase.auth().currentUser;

    // Listener
    user.onAuthStateChanged(function (userObj) {
      //return currentUser console.log("userObj", userObj);
      // if(userObj){
        this.currentUser = firebase.auth().currentUser;
      // }else{
        // this.currentUser = null;
      // }

      console.log("on stage change: this.currentUser", this.currentUser);
      tag.update();
    });

    //sign-in with google
    this.logIn = function () {
      console.log("logging in...");
      var provider = new firebase.auth.GoogleAuthProvider();
      user.signInWithPopup(provider);
    }

    //sign-out
    this.logOut = function () {
      console.log("logging out...");
      user.signOut();
    }


  </script>

  <style>
    :scope {
      display: block;
      padding: 2em;
    }

    .login {
      background-color: lightgrey;
      padding: 2em;
      margin-top: 2em;
    }

    .memeMaker {
      padding: 2em;
      margin-top: 2em;
      background-color: grey;
    }

    .order {
      padding: 2em;
      margin-top: 2em;
      background-color: powderblue;
    }

    .filter {
      padding: 2em;
      margin-top: 2em;
      background-color: steelblue;
    }
  </style>
</admin>
