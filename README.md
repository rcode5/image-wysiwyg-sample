Bootstrap Wysihtml5 with Custom Image Insert
====

This sample app (powered by [Sinatra](http://www.sinatrarb.com/) and [Twitter Bootstrap](http://twitter.github.com/bootstrap/) demonstrates how with a small-ish amount of custom javascript (see static/custom_image_wysihtml5.js), you can add a nice image chooser dialog to the [Bootstrap-wysihtml5](https://github.com/jhollingworth/bootstrap-wysihtml5) wysiwyg editor.

To see it in action, 

    git clone git@github.com:rcode5/image-wysiwyg-sample.git
    cd image-wysiwyg-sample
    bundle
    bundle exec foreman start

Or, try out the version of this code hosted on Heroku: [http://wysihtml5-images.herokuapp.com/](http://wysihtml5-images.herokuapp.com/)

Many resources are pulled from CDN to keep the repo small.
The key file, if you're trying to customize your own, is static/custom_image_wysihtml5.  That's where the magic happens.
Recent updates based on code from [Bass Jobsen](https://github.com/bassjobsen) include a method of uploading an image in the dialog (leveraging jQuery.upload).  This demo app doesn't actually upload anything but fakes out the endpoint that would receive the upload.  It should be enough to show you how to do it.

Read more on the [rcode5 blog](http://rcode5.wordpress.com/2012/11/01/custom-image-upload-modal-with-bootstrap-wysihtml5/) to get into the details of the code.

Check the [demo app](http://wysihtml5-images.herokuapp.com/) to get more about how to use/install this feature.

### TODOs 

* Build this up as a package that is easy to integrate in your app


### Contribute

* feel free to fork this project and add/modify.  submit a pull request if you make exciting improvements.
