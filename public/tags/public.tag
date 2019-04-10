<public>
  <div class="login" if={!currentUser}>
    <p>Thanks for visiting. Please proceed to Google Authentication</p>
    <button type="button" onclick={ logIn }>Login</button>
  </div>

  <script>

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
  </style>

</public>
