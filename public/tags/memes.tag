<memes>
  <meme each={ myMemes }></meme>

  <script>
    var tag = this;
    this.myMemes = [];

    observable.on('updateMemes', function (passedData) {
      tag.myMemes = passedData;
      tag.update();
    });
  </script>

  <style>
  :scope {
    display: inline;
  }
  img {
    width: 100%;
  }
</style>
</memes>
