$(document).bind('cocoon:after-insert', function(e,inserted_item) {
    $('.picture-file-field').change(function(){
      var file = this.files[0];
      if (file){
        var image_path = "/pictures/" + file.name;
        $('.article-text-area').append("\n" + "[![](" + image_path + ")](" + image_path + ")");
      }
    });
});
