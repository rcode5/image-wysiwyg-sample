Bootstrap Wysihtml5 with Custom Image Insert
====

This sample app (powered by [Sinatra](http://www.sinatrarb.com/) and [Twitter Bootstrap](http://twitter.github.com/bootstrap/) demonstrates how with a small-ish amount of custom javascript (see static/custom_image_wysihtml5.js), you can add a nice image chooser dialog to the [Bootstrap-wysihtml5](https://github.com/jhollingworth/bootstrap-wysihtml5) wysiwyg editor.

To see it in action, 

    git clone git@github.com:rcode5/image-wysiwyg-sample.git
    cd image-wysiwyg-sample
    bundle
    bundle exec foreman start

Many resources are pulled from CDN to keep the repo small.
The key file, if you're trying to customize your own, is static/custom_image_wysihtml5.  That's where the magic happens.

Read more on the rcode5 blog to get into the details of the code.

