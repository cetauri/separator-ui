<%-- 
    Document   : upload
    Created on : Nov 3, 2012, 12:31:16 PM
    Author     : Amila
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Force latest IE rendering engine or ChromeFrame if installed -->
  <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
  <meta charset="utf-8">
  <title>jQuery File Upload Demo</title>
  <meta name="description" content="File Upload widget with multiple file selection, drag&amp;drop support, progress bar and preview images for jQuery. Supports cross-domain, chunked and resumable file uploads. Works with any server-side platform (Google App Engine, PHP, Python, Ruby on Rails, Java, etc.) that supports standard HTML form file uploads.">
  <meta name="viewport" content="width=device-width">
  <!-- Bootstrap CSS Toolkit styles -->
  <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
  <!-- Generic page styles -->
  <link rel="stylesheet" href="css/style.css">
  <!-- Bootstrap styles for responsive website layout, supporting different screen sizes -->
  <link rel="stylesheet" href="css/bootstrap-responsive.min.css">
  <!-- Bootstrap CSS fixes for IE6 -->
  <!--[if lt IE 7]><link rel="stylesheet" href="http://blueimp.github.com/cdn/css/bootstrap-ie6.min.css"><![endif]-->
  <!-- Bootstrap Image Gallery styles -->
  <link rel="stylesheet" href="css/bootstrap-image-gallery.min.css">
  <!-- CSS to style the file input field as button and adjust the Bootstrap progress bars -->
  <link rel="stylesheet" href="css/jquery.fileupload-ui.css">
  <!-- Shim to make HTML5 elements usable in older Internet Explorer versions -->
  <!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
</head>
<body>
<div class="navbar navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container">
      <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </a>
      <a class="brand" href="https://github.com/blueimp/jQuery-File-Upload">jQuery File Upload</a>
      <div class="nav-collapse">
        <ul class="nav">
          <li class="active"><a href="#">Demo</a></li>
          <li><a href="https://github.com/blueimp/jQuery-File-Upload/downloads">Downloads</a></li>
          <li><a href="https://github.com/blueimp/jQuery-File-Upload">Source Code</a></li>
          <li><a href="https://github.com/blueimp/jQuery-File-Upload/wiki">Documentation</a></li>
          <li><a href="https://github.com/blueimp/jQuery-File-Upload/issues">Issues</a></li>
          <li><a href="test/">Test</a></li>
          <li><a href="https://blueimp.net">&copy; Sebastian Tschan</a></li>
        </ul>
      </div>
    </div>
  </div>
</div>
<div class="container">
  <div class="page-header">
    <h1>jQuery File Upload Demo</h1>
  </div>
  <blockquote>
    <p>File Upload widget with multiple file selection, drag&amp;drop support, progress bars and preview images for jQuery.<br>
      Supports cross-domain, chunked and resumable file uploads and client-side image resizing.<br>
      Works with any server-side platform (PHP, Python, Ruby on Rails, Java, Node.js, Go etc.) that supports standard HTML form file uploads.</p>
  </blockquote>
  <br>
  <!-- The file upload form used as target for the file upload widget -->
  <form id="fileupload" action="UploadServlet" method="POST" enctype="multipart/form-data">
    <!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->
    <div class="row fileupload-buttonbar">
      <div class="span7">
        <!-- The fileinput-button span is used to style the file input field as button -->
                        <span class="btn btn-success fileinput-button">
                            <i class="icon-plus icon-white"></i>
                            <span>Add files...</span>
                            <input type="file" name="files[]" multiple>
                        </span>
        <button type="submit" class="btn btn-primary start">
          <i class="icon-upload icon-white"></i>
          <span>Start upload</span>
        </button>
        <button type="reset" class="btn btn-warning cancel">
          <i class="icon-ban-circle icon-white"></i>
          <span>Cancel upload</span>
        </button>
        <button type="button" class="btn btn-danger delete">
          <i class="icon-trash icon-white"></i>
          <span>Delete</span>
        </button>
        <input type="checkbox" class="toggle">
      </div>
      <!-- The global progress information -->
      <div class="span5 fileupload-progress fade">
        <!-- The global progress bar -->
        <div class="progress progress-success progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100">
          <div class="bar" style="width:0%;"></div>
        </div>
        <!-- The extended global progress information -->
        <div class="progress-extended">&nbsp;</div>
      </div>
    </div>
    <!-- The loading indicator is shown during file processing -->
    <div class="fileupload-loading"></div>
    <br>
    <!-- The table listing the files available for upload/download -->
    <table role="presentation" class="table table-striped"><tbody class="files" data-toggle="modal-gallery" data-target="#modal-gallery"></tbody></table>
  </form>
  <br>
  <div class="well">
    <h3>Demo Notes</h3>
    <ul>
      <li>The maximum file size for uploads in this demo is <strong>5 MB</strong> (default file size is unlimited).</li>
      <li>Only image files (<strong>JPG, GIF, PNG</strong>) are allowed in this demo (by default there is no file type restriction).</li>
      <li>Uploaded files will be deleted automatically after <strong>5 minutes</strong> (demo setting).</li>
      <li>You can <strong>drag &amp; drop</strong> files from your desktop on this webpage with Google Chrome, Mozilla Firefox and Apple Safari.</li>
      <li>Please refer to the <a href="https://github.com/blueimp/jQuery-File-Upload">project website</a> and <a href="https://github.com/blueimp/jQuery-File-Upload/wiki">documentation</a> for more information.</li>
      <li>Built with Twitter's <a href="http://twitter.github.com/bootstrap/">Bootstrap</a> toolkit and Icons from <a href="http://glyphicons.com/">Glyphicons</a>.</li>
    </ul>
  </div>
</div>
<!-- modal-gallery is the modal dialog used for the image gallery -->
<div id="modal-gallery" class="modal modal-gallery hide fade" data-filter=":odd">
  <div class="modal-header">
    <a class="close" data-dismiss="modal">&times;</a>
    <h3 class="modal-title"></h3>
  </div>
  <div class="modal-body"><div class="modal-image"></div></div>
  <div class="modal-footer">
    <a class="btn modal-download" target="_blank">
      <i class="icon-download"></i>
      <span>Download</span>
    </a>
    <a class="btn btn-success modal-play modal-slideshow" data-slideshow="5000">
      <i class="icon-play icon-white"></i>
      <span>Slideshow</span>
    </a>
    <a class="btn btn-info modal-prev">
      <i class="icon-arrow-left icon-white"></i>
      <span>Previous</span>
    </a>
    <a class="btn btn-primary modal-next">
      <span>Next</span>
      <i class="icon-arrow-right icon-white"></i>
    </a>
  </div>
</div>

<!-- The template to display files available for upload -->
<script id="template-upload" type="text/x-tmpl">
            {% for (var i=0, file; file=o.files[i]; i++) { %}
        <tr class="template-upload fade">
            <td class="preview"><span class="fade"></span></td>
            <td class="name"><span>{%=file.name%}</span></td>
            <td class="size"><span>{%=o.formatFileSize(file.size)%}</span></td>
            {% if (file.error) { %}
            <td class="error" colspan="2"><span class="label label-important">Error</span> {%=file.error%}</td>
            {% } else if (o.files.valid && !i) { %}
            <td>
                <div class="progress progress-success progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0"><div class="bar" style="width:0%;"></div></div>
            </td>
            <td class="start">{% if (!o.options.autoUpload) { %}
                <button class="btn btn-primary">
                    <i class="icon-upload icon-white"></i>
                    <span>Start</span>
                </button>
                {% } %}</td>
            {% } else { %}
            <td colspan="2"></td>
            {% } %}
            <td class="cancel">{% if (!i) { %}
                <button class="btn btn-warning">
                    <i class="icon-ban-circle icon-white"></i>
                    <span>Cancel</span>
                </button>
                {% } %}</td>
        </tr>
        {% } %}
    </script>
<!-- The template to display files available for download -->
<script id="template-download" type="text/x-tmpl">
        {% for (var i=0, file; file=o.files[i]; i++) { %}
        <tr class="template-download fade">
            {% if (file.error) { %}
            <td></td>
            <td class="name"><span>{%=file.name%}</span></td>
            <td class="size"><span>{%=o.formatFileSize(file.size)%}</span></td>
            <td class="error" colspan="2"><span class="label label-important">Error</span> {%=file.error%}</td>
            {% } else { %}
            <td class="preview">{% if (file.thumbnail_url) { %}
                <a href="{%=file.url%}" title="{%=file.name%}" rel="gallery" download="{%=file.name%}"><img src="{%=file.thumbnail_url%}"></a>
                {% } %}</td>
            <td class="name">
                <a href="{%=file.url%}" title="{%=file.name%}" rel="{%=file.thumbnail_url&&'gallery'%}" download="{%=file.name%}">{%=file.name%}</a>
            </td>
            <td class="size"><span>{%=o.formatFileSize(file.size)%}</span></td>
            <td colspan="2"></td>
            {% } %}
            <td class="delete">
                <button class="btn btn-danger" data-type="{%=file.delete_type%}" data-url="{%=file.delete_url%}"{% if (file.delete_with_credentials) { %} data-xhr-fields='{"withCredentials":true}'{% } %}>
                        <i class="icon-trash icon-white"></i>
                    <span>Delete</span>
                </button>
                <input type="checkbox" name="delete" value="1">
            </td>
        </tr>
        {% } %}
    </script>

<script src="js/jquery-1.8.2.min.js"></script>
<script src="js/vendor/jquery.ui.widget.js"></script>
<script src="js/tmpl.min.js"></script>
<script src="js/load-image.min.js"></script>
<script src="js/canvas-to-blob.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap-image-gallery.min.js"></script>
<script src="js/jquery.iframe-transport.js"></script>
<script src="js/jquery.fileupload.js"></script>
<script src="js/jquery.fileupload-fp.js"></script>
<script src="js/jquery.fileupload-ui.js"></script>
<script src="js/locale.js"></script>
<script src="js/main.js"></script>
</body>
</html>